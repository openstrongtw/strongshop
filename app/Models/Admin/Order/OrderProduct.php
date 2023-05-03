<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Admin\Order;

use App\Models\BaseModel as Model;

class OrderProduct extends Model
{

    public $tableComments = '訂單產品';
    protected $table = 'order_product';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $casts = ['specs' => 'json'];
    protected $appends = ['subtotal'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'order_id' => ['required', 'integer'],
            'product_id' => ['required', 'integer'],
            'title' => ['required', 'string', 'max:255'],
            'sku' => ['required', 'string', 'max:100'],
            'currency_code' => ['required', 'string', 'max:50'],
            'original_price' => ['required', 'numeric'],
            'sale_price' => ['required', 'numeric'],
            'img_cover' => ['string', 'max:255'],
            'specs' => ['string'],
            'qty' => ['required', 'integer'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
        ];
    }

    /**
     * Validator messages
     * @return type
     */
    public function messages()
    {
        return [];
    }

    /**
     * Validator customAttributes
     * @return type
     */
    public function customAttributes()
    {
        return [
            'id' => 'ID',
            'order_id' => '訂單id',
            'product_id' => '產品id',
            'title' => '產品標題',
            'sku' => 'SKU',
            'currency_code' => '結算貨幣',
            'original_price' => '原價',
            'sale_price' => '售價',
            'img_cover' => '產品封面圖',
            'specs' => '已選規格',
            'qty' => '已購數量',
            'created_at' => '建立時間',
            'updated_at' => '更新時間',
            'weight' => '重量(g)',
            'currency_rate' => '轉換率',
            'subtotal' => '價格小計',
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

    public function getCurrencyRateAttribute($value)
    {
        return floatval($value);
    }

    public function getSpecsAttribute($value)
    {
        return $value ? json_decode($value) : [];
    }

    public function getSubtotalAttribute($value)
    {
        $qty = $this->attributes['qty'];
        $sale_price = $this->attributes['sale_price'];
        $number = $qty * $sale_price;
        return app('strongshop')->dedimalTruncate($number);
    }

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

}
