<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Auth\Socialite;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Socialite;
use Illuminate\Support\Facades\Log;

class FacebookController extends Controller
{

    /**
     * 將使用者重定向到授權頁面
     *
     * @return \Illuminate\Http\Response
     */
    public function redirectToProvider()
    {
        return Socialite::driver('facebook')->redirect();
    }

    /**
     * 獲取使用者資訊
     *
     * @return \Illuminate\Http\Response
     */
    public function handleProviderCallback()
    {
        $socialite = Socialite::driver('facebook')->user();
        // $socialite->token;
        Log::info('$socialite', collect($socialite)->toArray());
        if ($socialite->getId())
        {
            $user = User::where('facebook_open_id', $socialite->getId())->first();
            if ($user)
            {
                if ($user->status != 1)
                {
                    abort(201, __('auth.failed'));
                }
                Auth::guard($this->guard)->login($user);
                return redirect(url('/'));
            }
        }

        if ($socialite->getEmail())
        {
            $user = User::where('email', $socialite->getEmail())->first();
            if ($user)
            {
                //abort(201, __('The account email already exist'));
                if (!$user->facebook_open_id)
                {
                    $user->facebook_open_id = $socialite->getId();
                    $user->save();
                }
                Auth::guard($this->guard)->login($user);
                return redirect(url('/'));
            }
        } else
        {
            abort(201, __('auth email not exists'));
        }

        $last_name = $socialite->user['family_name'] ?? '';
        $first_name = $socialite->user['given_name'] ?? ($socialite->getName() ?: '');
        $nickname = $socialite->getNickname() ?: $first_name;

        $user = new User();
        if ($socialite->getEmail())
        {
            $user->email = $socialite->getEmail();
            $user->email_verified_at = now();
        }
        $user->facebook_open_id = $socialite->getId();
        $user->last_name = $last_name;
        $user->first_name = $first_name;
        $user->nickname = $nickname;
        $user->avatar = $socialite->getAvatar() ?: '';
        $user->save();

        Auth::guard($this->guard)->login($user);
        return redirect(url('/'));
    }

}