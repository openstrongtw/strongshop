<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Admin\Order;

use App\Models\BaseModel as Model;
use App\Repositories\RegionRepository;
use App\Repositories\AppRepository;

class Order extends Model
{

    use \Illuminate\Database\Eloquent\SoftDeletes;

    public $tableComments = '訂單管理';
    protected $table = 'order';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $appends = ['country', 'state', 'currency', 'order_status_label', 'order_status_style'];

    const STATUS_UNPAID = 10; //待支付
    const STATUS_PAID = 12; //已支付
    const STATUS_PAY_FAILED = 13; //支付失敗
    const STATUS_PAY_EXCEPTION = 14; //支付異常
    const STATUS_SHIPPED = 20; //已發貨
    const STATUS_RECEIVED = 22; //已收穫
    const STATUS_RETURNING = 24; //退貨中
    const STATUS_RETURNED = 26; //已退貨
    const STATUS_DONE = 30; //已完成
    const STATUS_CANCELED = 40; //已取消（會員取消）
    const STATUS_CLOSED = 42; //已關閉(管理員關閉)

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'user_id' => ['nullable', 'nullable', 'integer'],
            'order_no' => ['nullable', 'string', 'max:100'],
            'products_amount' => ['nullable', 'numeric', 'gt:0'],
            'handling_fee' => ['nullable', 'numeric'],
            'shipping_fee' => ['nullable', 'numeric'],
            'discount_amount' => ['nullable', 'numeric'],
            'order_amount' => ['nullable', 'numeric', 'gt:0'],
            'paid_amount' => ['nullable', 'numeric'],
            'used_credits_amount' => ['nullable', 'numeric'],
            'order_status' => ['nullable', 'integer', 'min:1'],
            'shipping_option_id' => ['nullable', 'integer', 'min:1'],
            'payment_option_id' => ['nullable', 'integer', 'min:1'],
            'remark' => ['nullable', 'string', 'max:255'],
            'first_name' => ['nullable', 'string', 'max:255'],
            'last_name' => ['nullable', 'string', 'max:255'],
            'email' => ['nullable', 'string', 'max:255'],
            'phone' => ['nullable', 'string', 'max:255'],
            'fax' => ['nullable', 'string', 'max:255'],
            'country_code' => ['nullable', 'string', 'max:255'],
            'state_code' => ['nullable', 'string', 'max:255'],
            'state_other' => ['nullable', 'string', 'max:255'],
            'city' => ['nullable', 'string', 'min:1', 'max:255'],
            'address_line_1' => ['nullable', 'string', 'max:255'],
            'address_line_2' => ['nullable', 'string', 'max:255'],
            'postal_code' => ['nullable', 'string', 'max:255'],
            'billing_first_name' => ['nullable', 'string', 'max:255'],
            'billing_last_name' => ['nullable', 'string', 'max:255'],
            'billing_email' => ['nullable', 'string', 'max:255'],
            'billing_phone' => ['nullable', 'string', 'max:255'],
            'billing_fax' => ['nullable', 'string', 'max:255'],
            'billing_country_code' => ['nullable', 'string', 'max:255'],
            'billing_state_code' => ['nullable', 'string', 'max:255'],
            'billing_state_other' => ['nullable', 'string', 'max:255'],
            'billing_city' => ['nullable', 'string', 'max:255'],
            'billing_address_line_1' => ['nullable', 'string', 'max:255'],
            'billing_address_line_2' => ['nullable', 'string', 'max:255'],
            'billing_postal_code' => ['nullable', 'string', 'max:255'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
            'deleted_at' => ['date'],
            'tracking_no' => ['nullable', 'string', 'max:255'],
            'shipping_remark' => ['nullable', 'string', 'max:255'],
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
            'id' => '訂單id',
            'user_id' => '會員',
            'order_no' => '訂單編號',
            'currency_code' => '結算貨幣',
            'products_amount' => '產品總額',
            'handling_fee' => '支付手續費',
            'shipping_fee' => '配送費用',
            'tax_fee' => '稅收費用',
            'discount_amount' => '優惠金額',
            'order_amount' => '訂單金額',
            'paid_amount' => '已付金額',
            'used_credits_amount' => '積分金額',
            'order_status' => '訂單狀態',
            'shipping_option_id' => '配送方式',
            'payment_option_id' => '支付方式',
            'pay_remark' => '支付備註',
            'transaction_id' => '交易單號',
            'remark' => '訂單備註',
            'first_name' => '名',
            'last_name' => '姓',
            'email' => 'EMAIL',
            'phone' => '聯繫電話',
            'fax' => '傳真',
            'country_code' => '國家',
            'state_code' => '省',
            'state_other' => '其他省',
            'city' => '城市',
            'address_line_1' => '地址1',
            'address_line_2' => '地址2',
            'postal_code' => '郵編',
            'billing_first_name' => '名(賬單)',
            'billing_last_name' => '姓(賬單)',
            'billing_email' => 'Email(賬單)',
            'billing_phone' => '聯繫電話(賬單)',
            'billing_fax' => '傳真(賬單)',
            'billing_country_code' => '國家(賬單)',
            'billing_state_code' => '省(賬單)',
            'billing_state_other' => '其他省(賬單)',
            'billing_city' => '城市(賬單)',
            'billing_address_line_1' => '地址1(賬單)',
            'billing_address_line_2' => '地址2(賬單)',
            'billing_postal_code' => '郵編(賬單)',
            'created_at' => '下單時間',
            'updated_at' => '更新時間',
            'deleted_at' => '刪除時間',
            'currency' => '結算貨幣',
            'country' => '國家',
            'state' => '省',
            'paid_at' => '支付時間',
            'received_at' => '確認收貨時間',
            'tracking_no' => '跟蹤單號',
            'shipping_remark' => '配送備註',
            'canceled_at' => '取消訂單時間',
            'returned_at' => '退貨時間',
            'shipped_at' => '發貨時間',
            'weight_total' => '產品總重',
            'currency_rate' => '貨幣轉換率',
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

    /**
     * 國家名稱
     * @return string
     */
    public function getCountryAttribute()
    {
        if (isset($this->attributes['country_code']))
        {
            return RegionRepository::getCountry($this->attributes['country_code']);
        }
        return '';
    }

    /**
     * 省名稱
     * @return string
     */
    public function getStateAttribute()
    {
        if (isset($this->attributes['country_code']) && isset($this->attributes['state_code']))
        {
            return RegionRepository::getState($this->attributes['country_code'], $this->attributes['state_code']);
        }
        return '';
    }

    /**
     * 貨幣名稱
     * @return string
     */
    public function getCurrencyAttribute()
    {
        if (!isset($this->attributes['currency_code']) || !$this->attributes['currency_code'])
        {
            return '';
        }
        return AppRepository::getCurrencies($this->attributes['currency_code'])['name'] ?? '';
    }

    public function getOrderStatus($status = null)
    {
        $data = [
            self::STATUS_UNPAID => [
                'name' => __('Unpaid'),
                'style' => 'layui-bg-orange',
            ],
            self::STATUS_PAID => [
                'name' => __('Paid'),
                'style' => 'layui-bg-green',
            ],
            self::STATUS_PAY_EXCEPTION => [
                'name' => __('Pay Exception'),
                'style' => '',
            ],
            self::STATUS_PAY_FAILED => [
                'name' => __('Pay Failed'),
                'style' => '',
            ],
            self::STATUS_SHIPPED => [
                'name' => __('Shipped'),
                'style' => 'layui-bg-cyan',
            ],
            self::STATUS_RECEIVED => [
                'name' => __('Received'),
                'style' => 'layui-bg-cyan',
            ],
            self::STATUS_RETURNING => [
                'name' => __('Returning'),
                'style' => 'layui-bg-orange',
            ],
            self::STATUS_RETURNED => [
                'name' => __('Returned'),
                'style' => 'layui-bg-cyan',
            ],
            self::STATUS_DONE => [
                'name' => __('Done'),
                'style' => 'layui-bg-green',
            ],
            self::STATUS_CANCELED => [
                'name' => __('Canceled'),
                'style' => 'layui-bg-gray',
            ],
            self::STATUS_CLOSED => [
                'name' => __('Closed'),
                'style' => 'layui-bg-gray',
            ],
        ];
        if (!$status)
        {
            return $data;
        }
        return $data[$status] ?? [];
    }

    /**
     * 訂單狀態名稱
     * @return string
     */
    public function getOrderStatusLabelAttribute()
    {
        if (!isset($this->attributes['order_status']))
        {
            return '';
        }
        $value = $this->attributes['order_status'];
        $data = $this->getOrderStatus($value);
        return $data['name'] ?? '';
    }

    /**
     * 訂單狀態樣式[後臺]
     * @return string
     */
    public function getOrderStatusStyleAttribute()
    {
        if (!isset($this->attributes['order_status']))
        {
            return '';
        }
        $value = $this->attributes['order_status'];
        $data = $this->getOrderStatus($value);
        return $data['style'] ?? '';
    }

    public function getCurrencyRateAttribute($value)
    {
        return floatval($value);
    }

    /**
     * 訂單產品
     * @return type
     */
    public function orderProducts()
    {
        return $this->hasMany(OrderProduct::class);
    }

    /**
     * 購買會員
     * @return type
     */
    public function buyer()
    {
        return $this->belongsTo(\App\Models\User::class, 'user_id')->withTrashed();
    }

    /**
     * 配送方式
     */
    public function shippingOption()
    {
        return $this->belongsTo(\App\Models\ShippingOption::class, 'shipping_option_id');
    }

    /**
     * 支付方式
     */
    public function paymentOption()
    {
        return $this->belongsTo(\App\Models\PaymentOption::class, 'payment_option_id');
    }

}
