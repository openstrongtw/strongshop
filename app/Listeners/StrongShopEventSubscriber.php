<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Listeners;

class StrongShopEventSubscriber
{

    protected $listen = [];

    public function __construct()
    {
        $this->listen = config('strongshop.listen');
    }

    /**
     * 為訂閱者註冊監聽器.
     *
     * @param  \Illuminate\Events\Dispatcher  $events
     */
    public function subscribe($events)
    {
        foreach ($this->listen as $key => $val)
        {
            $events->listen($key, $val);
        }
    }

}
