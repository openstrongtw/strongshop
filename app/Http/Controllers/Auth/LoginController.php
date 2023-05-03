<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Auth\Events\Login;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Repositories\AuthRepository;
use App\Notifications\User\SendSecurityCodeNotification;

class LoginController extends Controller
{

    use AuthenticatesUsers;

    public $maxAttempts = 3; //允許登錯幾次
    public $decayMinutes = 5; //登錄失敗超過 $maxAttempts 次 禁止 $decayMinutes 分鐘登錄

    public function __construct()
    {
        $this->maxAttempts = app('strongshop')->getShopConfig('signin_max_attempts');
        $this->decayMinutes = app('strongshop')->getShopConfig('signin_decay_minutes', $this->decayMinutes);
    }

    /**
     * Show the application login form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showLoginForm(Request $request)
    {
        $redirectTo = $request->session()->pull('url.intended', $request->server('HTTP_REFERER', url('/')));
        return view('auth.login', ['redirectTo' => $redirectTo]);
    }

    public function showLoginCodeForm(Request $request)
    {
        $redirectTo = $request->session()->pull('url.intended', $request->server('HTTP_REFERER', url('/')));
        return view('auth.login', ['redirectTo' => $redirectTo]);
    }

    /**
     * 登錄
     * @param Request $request
     * @return type
     */
    public function login(Request $request)
    {
        $rules = [
            'username' => ['required', 'string', 'email', 'max:255', 'exists:user,email'],
            'way' => ['string', 'min:4', 'max:99', 'in:code,password'], //登錄方式
            'password' => ['required_if:way,password', 'string', 'min:6'],
            'code' => ['required_if:way,code', 'string'],
            'remember' => ['boolean'],
        ];
        $messages = [];
        $customAttributes = [
            'username' => __('Email'),
            'password' => __('Password'),
        ];
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        /**
         * 登錄失敗次數限制
         * If the class is using the ThrottlesLogins trait, we can automatically throttle
         * the login attempts for this application. We'll key this by the username and
         * the IP address of the client making these requests into this application.
         */
        if ($this->maxAttempts > 0 && method_exists($this, 'hasTooManyLoginAttempts') && $this->hasTooManyLoginAttempts($request))
        {
            $this->fireLockoutEvent($request);
            $replace = [
                'seconds' => $this->decayMinutes * 60,
                'minutes' => $this->decayMinutes
            ];
            return ['code' => 4001, 'message' => __('auth.throttle', $replace)];
        }
        $user_name = $this->username(); //登錄欄位
        $user = User::where($user_name, $request->username)->first();
        if (!$user || $user->status !== 1)
        {
            return ['code' => 4010, 'message' => __('auth.failed')];
        }
        //驗證碼登錄
        if ($request->way === 'code')
        {
            $_code = AuthRepository::getCode($request->username);
            if ($_code !== $request->code)
            {
                return ['code' => 4001, 'message' => __('Invalid verification code')];
            }
            if (!$user->email_verified_at)
            {
                $user->email_verified_at = now();
            }
        } else
        {
            if (!Hash::check($request->password, $user->password))
            {
                $this->incrementLoginAttempts($request); //累加登錄失敗次數
                return ['code' => 4002, 'message' => __('auth.failed')];
            }
        }

        if ($this->isApi)
        {
            //api登錄
            $user->api_token = AuthRepository::generateApiToken();
            $user->api_token_at = config('strongshop.apiToken.ttl') ? now()->addSeconds(config('strongshop.apiToken.ttl')) : null;
            $user->api_token_refresh_at = config('strongshop.apiToken.refresh_ttl') ? now()->addSeconds(config('strongshop.apiToken.refresh_ttl')) : null;
            //觸發`登錄成功`事件（如果是web登錄 `Auth::guard($this->guard)->login()` 已自動觸發事件，無需再次觸發）
            event(new Login($this->guard, $user, $request->remember));
        } else
        {
            //web登錄
            Auth::guard($this->guard)->login($user, $request->remember);
            if (app('strongshop')->getShopConfig('signin_tip_email_verified') && $user instanceof MustVerifyEmail && !$user->hasVerifiedEmail())
            {
                $request->session()->flash('status', __('Your email address is not verified. It is strongly recommended that you verify the email'));
            }
        }

        /*
         *  登錄成功后邏輯
         */
        $this->clearLoginAttempts($request); //清除登錄鎖定
        $user->last_login_ip = $request->ip();
        $user->last_login_at = now();
        $user->save();

        return ['code' => 200, 'message' => __('Success'), 'data' => [
                'token' => $user->api_token,
                'user' => $user,
        ]];
    }

    /**
     * 驗證碼
     * @return type
     */
    public function loginCode(Request $request)
    {
        $rules = [
            'username' => ['required', 'string', 'email', 'max:255', 'exists:user,email'],
        ];
        $messages = [];
        $customAttributes = [
            'username' => __('Email'),
        ];
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $user = User::where($this->username(), $request->username)->first();
        if (!$user || $user->status !== 1)
        {
            return ['code' => 4010, 'message' => __('auth.failed')];
        }
        $code = (string) random_int(100000, 999999);
        AuthRepository::setCode($request->username, $code);
        $user->notify(new SendSecurityCodeNotification($code));
        return ['code' => 200, 'message' => __('Verification code mail sent successfully. If you have not received it, please check your spam folder.')];
    }

    /**
     * Log the user out of the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        if ($this->isApi)
        {
            if ($this->user)
            {
                $this->user->api_token = null;
                $this->user->save();
            }
            return ['cdoe' => 200, 'message' => __('Success')];
        }

        $this->guard()->logout();
//        $request->session()->invalidate();
//        $request->session()->regenerateToken();

        return redirect($request->server('HTTP_REFERER', url('/')));
    }

    /**
     * 登錄欄位
     * @return string
     */
    public function username()
    {
        return 'email';
    }

}
