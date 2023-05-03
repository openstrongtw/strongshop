<?php

namespace App\Http\View\Composers;

use Illuminate\View\View;
use App\Repositories\AppRepository;
use App\Repositories\ProductRepository;

class LayoutsComposer
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
        $this->user = app('strongshop')->user ?: null;
        $this->user_id = $this->user ? $this->user->id : null;
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
        $user_id = $this->user_id;

        //商店配置
        //$view->with('_STRONGSHOP_CONFIG', AppRepository::getShopConfig());
        //語言
        $view->with('_languages', AppRepository::getLanguages());
        //貨幣
        $view->with('_currencies', AppRepository::getCurrencies()); //貨幣列表
        //產品分類
        $view->with('_categories', ProductRepository::getCategories());
        //產品收藏總數
        $view->with('_wish_list_total', \DB::table('user_collect')->where('user_id', $user_id)->count());
        //未讀反饋回覆
        $view->with('_unread_feedback_replies_total', \DB::table('user_feedback')->where('user_id', $user_id)->where('status', 2)->whereNull('read_at')->count() ?: '');
    }

}
