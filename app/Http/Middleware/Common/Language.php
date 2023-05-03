<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Middleware\Common;

use Closure;
use App;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Cookie;
use App\Repositories\AppRepository;
use Illuminate\Support\Facades\View;
use App\Repositories\CartRepository;
class Language
{

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $languages = AppRepository::getLanguages();
        $currencies = AppRepository::getCurrencies();
        $route_prefix = $request->route()->getPrefix();
        $currency = $_locale = null;
        if (AppRepository::isWeb() && $route_prefix)
        {
            //根據路由字首判斷語言
            $route_prefix = Str::before($route_prefix, '/');
            $_locale = $route_prefix;
        } elseif ($request->get('locale'))
        {
            //根據url參數判斷語言
            $_locale = $request->get('locale');
        } elseif ($request->header('locale'))
        {
            //根據hader頭設定判斷語言
            $_locale = $request->header('locale');
        } else
        {
            //根據cookie設定判斷語言
            $_locale = Cookie::get('locale');
        }
        $locale = isset($languages[$_locale]) && $languages[$_locale] ? $_locale : config('strongshop.defaultLanguage');

        //貨幣
        if ($request->get('currency'))
        {
            $currency = $request->get('currency');
        } elseif ($request->header('currency'))
        {
            $currency = $request->header('currency');
        } else
        {
            //根據cookie設定判斷語言
            $currency = Cookie::get('currency');
        }
        $currency = isset($currencies[$currency]) && $currencies[$currency] ? $currency : config('strongshop.defaultCurrency');

        App::setLocale($locale); //設定語言

        $response = $next($request);
        if ($locale !== Cookie::get('locale'))
        {
            //設定語言cookie
            $response->cookie('locale', $locale, 60 * 24 * 365);
        }
        if ($currency !== Cookie::get('currency'))
        {
            //設定貨幣cookie
            $response->cookie('currency', $currency, 60 * 24 * 365);
        }
        $response->header('locale', $locale); //輸出hader
        $response->header('currency', $currency); //輸出hader
        return $response;
    }

}
