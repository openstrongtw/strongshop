<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models;

use App\Models\Admin\Article\Article as Model;

class Article extends Model
{

    protected $appends = ['brief'];

    public function getTitleAttribute($value)
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

    public function getContentAttribute($value)
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

    public function getBriefAttribute()
    {
        $value = $this->getAttribute('content');
        $value = strip_tags($value);
        $value = mb_substr($value, 0, 100);
        return $value;
    }

}
