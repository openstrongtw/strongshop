<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Repositories;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use App\Models\Admin\WebConfig;

class AppRepository
{

    /**
     * strongshop 系統版本
     */
    const VERSION = '1.5.5';

    /**
     * uuid
     */
    public $uuid = null;

    /**
     * 是否是`api`路由組
     * @return bool
     */
    public static function isApi(): bool
    {
        $guard = self::getGuard();
        return $guard === 'api' ? true : false;
    }

    /**
     * 是否是`web`路由組
     * @return bool
     */
    public static function isWeb(): bool
    {
        $guard = self::getGuard();
        return $guard === 'web' ? true : false;
    }

    /**
     * 獲取語言
     */
    public static function getLanguages($key = null)
    {
        $datas = config('strongshop.langs');
        if ($key)
        {
            $datas = Arr::get($datas, $key);
        }
        return $datas;
    }

    /**
     * 目前語言 code
     * @return type
     */
    public static function getCurrentLanguage()
    {
        $route_prefix = request()->route() ? request()->route()->getPrefix() : null;
        $code = null;
        if (self::isWeb() && $route_prefix)
        {
            $route_prefix = Str::before($route_prefix, '/');
            $code = $route_prefix;
        }
        if (!$code)
        {
            $code = request('locale', request()->header('locale')) ?: request()->cookie('locale', config('strongshop.defaultLanguage'));
        }
        if (!$code || !self::getLanguages($code))
        {
            $code = config('strongshop.defaultLanguage');
        }
        return $code;
    }

    /**
     * 目前語言名稱
     * @return type
     */
    public static function getCurrentLanguageName()
    {
        $data = self::getCurrentLanguage();
        return self::getLanguages("{$data}.name");
    }

    /**
     * 獲取貨幣
     */
    public static function getCurrencies($key = null)
    {
        $datas = config('strongshop.currencies');
        if ($key)
        {
            $datas = Arr::get($datas, $key);
        }
        return $datas;
    }

    /**
     * 目前貨幣 code
     * @return type
     */
    public static function getCurrentCurrency()
    {
        $currency = request('currency', request()->header('currency')) ?: request()->cookie('currency');
        if (!$currency || !self::getCurrencies($currency))
        {
            $currency = config('strongshop.defaultCurrency');
        }
        return $currency;
    }

    /**
     * 目前貨幣 name
     * @return type
     */
    public static function getCurrentCurrencyName()
    {
        $currency = self::getCurrentCurrency();
        return config("strongshop.currencies.{$currency}.name");
    }

    /**
     * 目前貨幣 費率
     * @return type
     */
    public static function getCurrentCurrencyRate()
    {
        $data = self::getCurrentCurrency();
        $rate = self::getCurrencies("{$data}.rate");
        return $rate;
    }

    /**
     * 預設貨幣按照費率轉換成選擇的貨幣
     * @param type $price
     * @return type
     */
    public static function convertCurrency($price, $currency_code = null)
    {
        if ($currency_code)
        {
            $rate = self::getCurrencies("{$currency_code}.rate");
        } else
        {
            $rate = self::getCurrentCurrencyRate();
        }
        $number = $rate * $price;
        return self::dedimalTruncate($number);
    }

    /**
     * 按照費率轉換成預設貨幣
     * @param type $price
     * @param type $rate 稅率
     * @param type $defaultDedimal 保留小數位數
     * @return type
     */
    public static function convertCurrencyToDefault($price, $rate = null, $defaultDedimal = 2)
    {
        if (!$rate)
        {
            $rate = self::getCurrentCurrencyRate();
        }
        $number = $price / $rate;
        return self::dedimalTruncate($number, $defaultDedimal);
    }

    /**
     * 保留小數位數
     * @param type $number 金額
     * @param type $defaultDedimal 小數位數
     * @return type
     */
    public static function dedimalTruncate($number, $defaultDedimal = null)
    {
        if (!$defaultDedimal)
        {
            $defaultDedimal = config('strongshop.defaultDedimal');
        }
        if ($defaultDedimal < 0)
        {
            $defaultDedimal = 0;
        }
        $number = round($number, $defaultDedimal, PHP_ROUND_HALF_UP);
        return sprintf("%.{$defaultDedimal}f", $number);
    }

    /**
     * 獲取登錄使用者資訊
     * @return type
     */
    public static function getUser()
    {
        $guard = self::getGuard();
        if (!$guard)
        {
            return null;
        }
        return Auth::guard($guard)->check() ? Auth::guard($guard)->user() : null;
    }

    /**
     * 獲取登錄守護名稱
     * @return string
     */
    public static function getGuard()
    {
        if (!request()->route())
        {
            return null;
        }
        $data = request()->route()->gatherMiddleware() ?: [];
        if (is_string($data))
        {
            $data = [$data];
        }
        if (array_search('api', $data) !== false)
        {
            return 'api';
        } elseif (array_search('web', $data) !== false)
        {
            return 'web';
        } else
        {
            return null;
        }
    }

    /**
     * 獲取 uuid
     */
    public function getUuid()
    {
        $uuid = request()->header('uuid', request()->cookie('uuid'));
        $this->uuid = $uuid;
        if (!$uuid)
        {
            $this->uuid = (string) Str::uuid();
        }
        return $this->uuid;
    }

    /**
     * 獲取網站配置
     * @param type $key 鍵名
     * @return string
     */
    public static function getShopConfig($key, $default = null)
    {
        $datas = cache('webconfig');
        if (!$datas)
        {
            $rows = WebConfig::query()->get();
            $datas = [];
            foreach ($rows as $row)
            {
                $datas[$row->key] = $row->value;
            }
            cache(['webconfig' => $datas]);
        }
        return $datas[$key] ?? $default;
    }

    /**
     * 修改配置資訊
     */
    public static function changeConfig()
    {
        if (config('mail.driver') !== 'smtp')
        {
            return false;
        }
        $MAIL_HOST = self::getShopConfig('MAIL_HOST');
        $MAIL_PORT = self::getShopConfig('MAIL_PORT');
        $MAIL_USERNAME = self::getShopConfig('MAIL_USERNAME');
        $MAIL_PASSWORD = self::getShopConfig('MAIL_PASSWORD');
        $MAIL_ENCRYPTION = self::getShopConfig('MAIL_ENCRYPTION');
        $MAIL_REPLYTO_ADDRESS = self::getShopConfig('MAIL_REPLYTO_ADDRESS');
        $MAIL_REPLYTO_NAME = self::getShopConfig('MAIL_REPLYTO_NAME');

        if ($MAIL_HOST)
        {
            config(['mail.host' => $MAIL_HOST]);
        }
        if ($MAIL_PORT)
        {
            config(['mail.port' => $MAIL_PORT]);
        }
        if ($MAIL_USERNAME)
        {
            config(['mail.username' => $MAIL_USERNAME]);
            config(['mail.from.address' => $MAIL_USERNAME]);
        }
        if ($MAIL_PASSWORD)
        {
            config(['mail.password' => $MAIL_PASSWORD]);
        }
        if ($MAIL_ENCRYPTION)
        {
            config(['mail.encryption' => $MAIL_ENCRYPTION]);
        }
        if ($MAIL_REPLYTO_ADDRESS)
        {
            config(['mail.reply_to.address' => $MAIL_REPLYTO_ADDRESS]);
        }
        if ($MAIL_REPLYTO_NAME)
        {
            config(['mail.reply_to.name' => $MAIL_REPLYTO_NAME]);
        }

        return true;
    }

    /**
     * 獲取版本資訊
     * @return type
     */
    public function getVersion()
    {
        return self::VERSION;
    }

    /**
     * 魔術方法
     * @param type $name
     * @return type
     */
    public function __get($name)
    {
        $action = 'get' . ucfirst($name);
        return $this->$action();
    }

}
