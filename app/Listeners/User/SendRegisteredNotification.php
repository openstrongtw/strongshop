<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Listeners\User;

use Illuminate\Auth\Events\Registered;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\Notifications\User\RegisteredSuccess;

class SendRegisteredNotification
{

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  Registered  $event
     * @return void
     */
    public function handle(Registered $event)
    {
        if (!app('strongshop')->getShopConfig('notice_email_signed'))
        {
            return false;
        }
        //發送`註冊成功`郵件通知
        $event->user->notify(new RegisteredSuccess());
        //發送`驗證`郵件通知
        if ($event->user instanceof MustVerifyEmail && !$event->user->hasVerifiedEmail())
        {
            $event->user->sendEmailVerificationNotification();
        }
    }

}
