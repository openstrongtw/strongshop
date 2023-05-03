<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Model;

class ProductComment extends Model
{

    use \Illuminate\Database\Eloquent\SoftDeletes;

    public $tableComments = '產品評論表';
    protected $table = 'product_comment';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $casts = ['pictures' => 'json', 'videos' => 'json', 'more' => 'json'];
    protected $hidden = ['deleted_at'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'user_id' => ['required', 'integer'],
            'at_user_id' => ['integer'],
            'product_id' => ['integer'],
            'product_sku' => ['string', 'max:50'],
            'content' => ['required', 'string', 'max:2000'],
            'pictures' => ['array'],
            'videos' => ['array'],
            'likes' => ['required', 'integer'],
            'status' => ['required', 'integer'],
            'credits' => ['required', 'integer'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
            'deleted_at' => ['date'],
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
            'user_id' => '會員id',
            'first_name' => '會員名',
            'last_name' => '會員姓',
            'country' => '會員所屬國家',
            'at_user_id' => '@會員id',
            'product_id' => '產品id',
            'product_sku' => '產品sku',
            'content' => '內容',
            'pictures' => '圖片',
            'videos' => '視訊',
            'likes' => '點贊數',
            'star' => '星級',
            'status' => '狀態',
            'credits' => '獲得積分獎勵',
            'created_at' => '建立時間',
            'updated_at' => '更新時間',
            'deleted_at' => '刪除時間',
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

    public function getContentShortAttribute($value = null)
    {
        $len = mb_strlen($value);
        if ($len > 100)
        {
            $value = mb_substr($value, 0, 100) . ' ...';
            return $value;
        }
        return $value;
    }

    public function getUploadAtAttribute($value = null)
    {
        if ($value)
        {
            return now()->parse($value)->toFormattedDateString();
        }
        return $value;
    }

    /**
     * 作品圖片【絕對路徑】
     */
    public function getAssetPicturesAttribute($value = null)
    {
        if (!$value)
        {
            $value = $this->getAttribute('pictures');
        }
        if (!$value || empty($value))
        {
            return $value;
        }
        $datas = json_decode($value, 1);
        foreach ($datas as &$data)
        {
            $data['src'] = asset($data['src']);
        }
        return $datas;
    }

    /**
     * 作品圖片封面圖
     */
    public function getAssetPictureCoverAttribute($value = null)
    {
        if (!$value)
        {
            $value = $this->getAttribute('pictures');
        }
        if (!$value || empty($value))
        {
            return $value;
        }
        $datas = json_decode($value, 1);
        if (empty($datas))
        {
            return [
                'src' => '',
                'width' => '',
                'height' => '',
            ];
        }
        return [
            'src' => asset($datas[0]['src_thumb']),
            'width' => $datas[0]['thumb_width'],
            'height' => $datas[0]['thumb_height'],
        ];
    }

    /**
     * 評論者
     * @return type
     */
    public function user()
    {
        return $this->belongsTo(\App\Models\User::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class)->withTrashed();
    }

}
