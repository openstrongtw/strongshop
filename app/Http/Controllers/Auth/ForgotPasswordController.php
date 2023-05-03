<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Validator;

class ForgotPasswordController extends Controller
{

    use SendsPasswordResetEmails;

    /**
     * Send a reset link to the given user.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    public function sendResetLinkEmail(Request $request)
    {
        if ($this->isApi)
        {
            $rules = [
                'email' => ['required', 'string', 'email', 'max:255', 'exists:user,email'],
            ];
            $messages = [];
            $customAttributes = [
                'email' => __('Email'),
            ];
            $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
            if ($validator->fails())
            {
                return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
            }
        }
        $this->validateEmail($request);

        // We will send the password reset link to this user. Once we have attempted
        // to send the link, we will examine the response then see the message we
        // need to show to the user. Finally, we'll send out a proper response.
        $response = $this->broker()->sendResetLink(
                $this->credentials($request)
        );
        if ($response == Password::RESET_LINK_SENT)
        {
            return $this->isApi ? ['code' => 200, 'message' => 'Success'] : $this->sendResetLinkResponse($request, $response);
        }
        return $this->isApi ? ['code' => 4001, 'message' => 'Failed'] : $this->sendResetLinkFailedResponse($request, $response);
    }

}
