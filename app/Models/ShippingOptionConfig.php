<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models;

use App\Models\BaseModel as Model;

class ShippingOptionConfig extends Model
{

    use \Illuminate\Database\Eloquent\SoftDeletes;

    public $tableComments = '配送費用公式';
    protected $table = 'shipping_option_config';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $casts = ['more' => 'json', 'countries' => 'json'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'title' => ['required', 'string', 'max:255'],
            'shipping_option_id' => ['nullable', 'integer'],
            'countries' => ['required', 'array', 'min:1'],
            'states' => ['string'],
            'more' => ['required', 'array'],
            'more.range_wieght' => ['required', 'array', 'min:1'],
            'more.range_wieght.*.range.start' => ['required', 'integer', 'gt:0', 'distinct'],
            'more.range_wieght.0.range.start' => ['required', 'integer', 'size:0'],
            'more.range_wieght.*.range.end' => ['required', 'integer', 'gt:more.range_wieght.*.range.start', 'distinct'],
            'more.range_wieght.*.first_weight.weight' => ['required', 'integer', 'gt:0'],
            'more.range_wieght.*.first_weight.amount' => ['required', 'numeric', 'gt:0'],
            'more.range_wieght.*.continued_weight.weight' => ['required', 'integer', 'gt:0'],
            'more.range_wieght.*.continued_weight.amount' => ['required', 'numeric', 'gt:0'],
            'more.over_weight.weight' => ['required', 'integer', 'gt:0'],
            'more.over_weight.amount' => ['required', 'numeric', 'gt:0'],
            'status' => ['required', 'integer'],
            'updated_at' => ['date'],
            'created_at' => ['date'],
        ];
    }

    /**
     * Validator messages
     * @return type
     */
    public function messages()
    {
        return [
            'more.range_wieght.*.range.start.distinct' => '重量範圍 起始值 不能重複',
        ];
    }

    /**
     * Validator customAttributes
     * @return type
     */
    public function customAttributes()
    {
        return [
            'id' => 'ID',
            'title' => '標題',
            'shipping_option_id' => '配送方式id',
            'countries' => '國家',
            'states' => '省',
            'more' => '配置',
            'status' => '狀態',
            'updated_at' => 'UPDATED_AT',
            'created_at' => 'CREATED_AT',
            'more.range_wieght.*.range.start' => '重量範圍 起始值',
            'more.range_wieght.0.range.start' => '首個公式重量範圍 起始值',
            'more.range_wieght.*.range.end' => '重量範圍 結束值',
            'more.range_wieght.*.first_weight.weight' => '首重 重量',
            'more.range_wieght.*.first_weight.amount' => '首重 費用',
            'more.range_wieght.*.continued_weight.weight' => '續重 重量',
            'more.range_wieght.*.continued_weight.amount' => '續重 費用',
            'more.over_weight.weight' => '超出範圍 重量',
            'more.over_weight.amount' => '超出範圍 費用',
        ];
    }

    public function getAttributeLabel($key)
    {
        $datas = $this->customAttributes();
        return $datas[$key] ?? $key;
    }

    /**
     * Fill the model with an array of attributes.
     * @param type $attributes
     * @return $this
     */
    public function fill($attributes)
    {
        foreach ($attributes as $key => $attribute)
        {
            if ($attribute === null)
            {
                unset($attributes[$key]);
            }
        }
        parent::fill($attributes);
        return $this;
    }

}
