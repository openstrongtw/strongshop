<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Product;

use App\Models\Admin\Product\Spec as Model;

class Spec extends Model
{

    public function getNameAttribute($value)
    {
        if (!$value)
        {
            return $value;
        }
        $lang_front = app('strongshop')->getCurrentLanguage();
        $arr = json_decode($value, true);
        if (!$arr)
        {
            return $value;
        }
        return $arr[$lang_front] ?? array_shift($arr);
    }

}
