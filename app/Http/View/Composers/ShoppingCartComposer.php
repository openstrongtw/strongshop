<?php

namespace App\Http\View\Composers;

use Illuminate\View\View;
use App\Repositories\CartRepository;
use App\Repositories\ShippingRepository;
use App\Repositories\RegionRepository;

class ShoppingCartComposer
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
        $this->cart = CartRepository::getCart();
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
        $cart = $this->cart;
        if (config('strongshop.showShipingFeeInCart'))
        {
            if ($this->user && $this->user->country_code)
            {
                $_user_country_code = app('strongshop')->user->country_code; //會員所屬國家code
            } else
            {
                $_user_country_code = config('strongshop.defaultCountry'); //預設國家code
            }
            //顯示配送費用
            $shipping_fee_list = ShippingRepository::getShippingFeeList($cart['cart_weight'], $_user_country_code);
            $shipping_total = $shipping_fee_list[0]['fee'] ?? 0;
            $view->with('_countries', RegionRepository::countries()); //國家列表
            $view->with('_user_country_code', $_user_country_code); //會員所屬國家code
            $view->with('_shipping_options', $shipping_fee_list); //配送方式列表
        } else
        {
            $shipping_total = false; // false 表示不顯示配送費用
        }
        $cart['total']['shipping_total'] = $shipping_total;

        //購物車
        $view->with('_cart', $cart);
    }

}
