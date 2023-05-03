<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\VerifiesEmails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Auth\Events\Verified;

class VerificationController extends Controller
{
    /*
      |--------------------------------------------------------------------------
      | Email Verification Controller
      |--------------------------------------------------------------------------
      |
      | This controller is responsible for handling email verification for any
      | user that recently registered with the application. Emails may also
      | be re-sent if the user didn't receive the original email message.
      |
     */

use VerifiesEmails;

    /**
     * Where to redirect users after verification.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth')->except('verifyForApi');
        $this->middleware('signed')->only('verify');
        $this->middleware('throttle:6,1')->only('verify', 'resend');
    }

    protected function redirectPath()
    {
        return route('user.index');
    }

    /**
     * Mark the authenticated user's email address as verified.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     *
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function verifyForApi(Request $request)
    {
        if (!hash_equals((string) $request->route('id'), (string) $request->user('api')->getKey()))
        {
            return ['code' => 4001, 'message' => 'id invalid'];
        }

        if (!hash_equals((string) $request->route('hash'), sha1($request->user('api')->getEmailForVerification())))
        {
            return ['code' => 4002, 'message' => 'hash invalid'];
        }

        if ($request->user('api')->hasVerifiedEmail())
        {
            return ['code' => 200, 'message' => 'Success'];
        }

        if ($request->user('api')->markEmailAsVerified())
        {
            event(new Verified($request->user('api')));
        }

        return ['code' => 200, 'message' => 'Success'];
    }

}
