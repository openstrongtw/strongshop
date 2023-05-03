<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Product;

use App\Models\Admin\Product\Product as Model;
use App\Repositories\AppRepository;

class Product extends Model
{
    //use \Laravel\Scout\Searchable;

    /**
     * 配置模型索引 「scout 搜索」
     * 預設情況下，每個模型都會被持久化到與模型的 「表」 名（通常是模型名稱的複數形式）相匹配的索引。
     * @return string
     */
    public function searchableAs(): string
    {
        return $this->getTable() . '_type';
    }

    /**
     * 配置可搜索數據 「scout 搜索」
     * 預設情況下，模型以完整的 toArray 格式持久化到搜索索引。
     * @return array
     */
    public function toSearchableArray(): array
    {
        return $this->only(['id', 'title', 'intro', 'meta_keywords', 'meta_description', 'spu', 'sku', 'status']);
    }

    /**
     * 售價 (按匯率轉換) （訪問器）
     * （訪問器 & 修改器 https://learnku.com/docs/laravel/6.x/eloquent-mutators/5179#defining-an-accessor）
     * @param type $value
     * @return type
     */
    public function getSalePriceAttribute($value)
    {
        return AppRepository::convertCurrency($value);
    }

    /**
     * 原價 (按匯率轉換)
     * @param type $value
     * @return type
     */
    public function getOriginalPriceAttribute($value)
    {
        return AppRepository::convertCurrency($value);
    }

    /**
     * 批發價格 (按匯率轉換)
     * @param type $value
     * @return type
     */
    public function getWholesaleSetAttribute($value)
    {
        if (!$value)
        {
            return $value;
        }
        $wholesale_set = json_decode($value, 1);
        foreach ($wholesale_set['price'] as $key => $val)
        {
            $wholesale_set['price'][$key] = AppRepository::convertCurrency($val);
        }
        return $wholesale_set;
    }

    /**
     * 封面圖
     */
    public function getImgCoverAttribute($value)
    {
        if (!$value)
        {
            return $value;
        }
        $thumb_suffix_name = config('strongshop.productImage.thumb.suffix_name');
        $path_arr = pathinfo($value); //路徑資訊
        $newpath = "{$path_arr['dirname']}/{$path_arr['filename']}{$thumb_suffix_name}.{$path_arr['extension']}";
        return asset($newpath);
    }

    /**
     * 規格圖
     */
    public function getImgSpecAttribute($value)
    {
        if (!$value)
        {
            return $value;
        }
        $thumb_suffix_name = config('strongshop.productImage.thumb.suffix_name');
        $path_arr = pathinfo($value); //路徑資訊
        $newpath = "{$path_arr['dirname']}/{$path_arr['filename']}{$thumb_suffix_name}.{$path_arr['extension']}";
        return asset($newpath);
    }

    /**
     * 相簿圖 [絕對路徑]
     */
    public function getAssetImgPhotosAttribute($value = null)
    {
        if (!$value)
        {
            $value = $this->getAttribute('img_photos');
        }
        if (!$value)
        {
            return $value;
        }
        $datas = json_decode($value, 1);
        foreach ($datas as &$data)
        {
            $src = $data['src'];
            $thumb_suffix_name = config('strongshop.productImage.thumb.suffix_name');
            $path_arr = pathinfo($src); //路徑資訊
            $newpath = "{$path_arr['dirname']}/{$path_arr['filename']}{$thumb_suffix_name}.{$path_arr['extension']}";
            $data['src_thumb'] = asset($newpath);
            $data['src'] = asset($src);
        }
        return $datas;
    }

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

    public function getIntroAttribute($value)
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

    public function getDetailsAttribute($value)
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

    /**
     * 所屬產品分類
     * （模型關聯 https://learnku.com/docs/laravel/6.x/eloquent-relationships/5177#many-to-many）
     * @return type
     */
    public function categories()
    {
        return $this->belongsToMany(Category::class, 'product_category', 'product_id', 'category_id');
    }

    /**
     * 擁有的產品規格
     */
    public function specs()
    {
        return $this->belongsToMany(Spec::class, 'product_spec', 'product_id', 'spec_id')->withPivot('spec_value');
    }

}
