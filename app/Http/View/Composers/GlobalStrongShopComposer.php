<?php

namespace App\Http\View\Composers;

use Illuminate\View\View;
use App\Repositories\AppRepository;

/**
 * 配置檢視全域性變數
 */
class GlobalStrongShopComposer
{

    public $user;
    public $user_id;
    public $cart;

    public function __construct()
    {
        if (!app('strongshop')->isWeb())
        {
            return;
        }
    }

    /**
     * 將數據繫結到檢視
     *
     * @param  View  $view
     * @return void
     */
    public function compose(View $view)
    {
        if (!app('strongshop')->isWeb())
        {
            return;
        }
        $view->with('_current_currency', AppRepository::getCurrentCurrency()); //目前貨幣code
        $view->with('_current_currency_name', AppRepository::getCurrentCurrencyName()); //目前貨幣名稱
    }

}
