<?php

namespace App\Listeners\Order;

use App\Events\CreatedOrder;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class SendOrderCreatedNotification
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
     * @param  CreatedOrder  $event
     * @return void
     */
    public function handle(CreatedOrder $event)
    {
        if (!app('strongshop')->getShopConfig('notice_email_created_order'))
        {
            return false;
        }
        $order = $event->order;
        $user = \App\Models\User::find($order->user_id);
        $user->notify(new \App\Notifications\Order\OrderCreatedNotification($order));
    }
}
