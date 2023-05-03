<?php

namespace App\Listeners\Order;

use App\Events\OrderPaid;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class SendOrderPaidNotification
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
     * @param  OrderPaid  $event
     * @return void
     */
    public function handle(OrderPaid $event)
    {
        if (!app('strongshop')->getShopConfig('notice_email_paid_order'))
        {
            return false;
        }
        $order = $event->order;
        $user = \App\Models\User::find($order->user_id);
        $user->notify(new \App\Notifications\Order\OrderPaidNotification($order));
    }
}
