<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Events\Login;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use App\Events\CreatedOrder;
use App\Events\OrderPaid;
use App\Events\OrderClosed;
use App\Events\OrderCanceled;
use App\Events\OrderShipped;
use App\Events\OrderReceived;

class EventServiceProvider extends ServiceProvider
{

    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        //註冊成功
        Registered::class => [
            \App\Listeners\User\SendRegisteredNotification::class, //發送`註冊成功`通知和驗證郵件
            \App\Listeners\User\UserSourceRecord::class, //記錄使用者來源
        ],
        //登錄成功
        Login::class => [
            \App\Listeners\UpdateShoppingCart::class, //更新購物車
        ],
        //重置密碼成功
        PasswordReset::class => [
        ],
        //下單成功
        CreatedOrder::class => [
            \App\Listeners\Order\OrderSourceRecord::class, //記錄訂單來源
            \App\Listeners\Order\SendOrderCreatedNotification::class, //發送通知
        ],
        //支付成功
        OrderPaid::class => [
            \App\Listeners\Order\SendOrderPaidNotification::class, //發送通知
        ],
        //訂單關閉（管理員關閉、超時未付款系統自動關閉）
        OrderClosed::class => [
            \App\Listeners\Order\SendOrderClosedNotification::class, //發送通知
        ],
        //訂單取消（會員主動取消）
        OrderCanceled::class => [
        ],
        //確認發貨
        OrderShipped::class => [
            \App\Listeners\Order\SendOrderShippedNotification::class, //發送通知
            \App\Listeners\Order\IncrementProductSaleNum::class, //累計產品銷量和減庫存
        ],
        //確認收貨（會員確認、系統自動確認）
        OrderReceived::class => [
        ],
    ];

    /**
     * 需要註冊的訂閱者類。
     *
     * @var array
     */
    protected $subscribe = [
        'App\Listeners\StrongShopEventSubscriber',
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }

}
