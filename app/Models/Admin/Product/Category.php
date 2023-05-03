<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Admin\Product;

use App\Models\BaseModel as Model;

class Category extends Model
{

    use \Illuminate\Database\Eloquent\SoftDeletes;

    public $tableComments = '產品分類';
    protected $table = 'category';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        $data = [
            'level' => ['required', 'integer'],
            'parent_id' => ['required', 'integer'],
            'name' => ['required', 'string', 'max:100'],
            'status' => ['required', 'integer'],
            'sort' => ['integer'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
            'meta_keywords' => ['nullable', 'string', 'max:255'],
            'meta_description' => ['nullable', 'string', 'max:255'],
        ];
        if (config('strongshop.multiLanguageBackend'))
        {
            $lang_front = config('strongshop.defaultLanguage');
            $data['name'] = ['required', 'array', 'max:99'];
            $data['name.' . $lang_front] = ['required', 'string', 'max:100'];
        }
        return $data;
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
            'id' => '分類id',
            'level' => '等級',
            'parent_id' => '上級分類',
            'name' => '分類名稱',
            'status' => '狀態',
            'sort' => '排序',
            'created_at' => '建立時間',
            'updated_at' => '更新時間',
            'meta_keywords' => 'MetaKeywords',
            'meta_description' => 'MetaDescription',
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

    public function setNameAttribute($value)
    {
        if (is_array($value))
        {
            $value = json_encode($value);
        }
        $this->attributes['name'] = $value;
    }
    
    public function getNameAttribute($value)
    {
        if (!$value)
        {
            return $value;
        }
        $lang_front = config('strongshop.defaultLanguage');
        $arr = json_decode($value, true);
        if (!$arr)
        {
            if (!config('strongshop.multiLanguageBackend'))
            {
                return $value;
            }
            return [$lang_front => $value];
        }
        if (!config('strongshop.multiLanguageBackend'))
        {
            return $arr[$lang_front] ?? array_shift($arr);
        }
        return $arr;
    }

    /**
     * name [後臺顯示]
     * @return type
     */
    public function getNameLabelAttribute($value)
    {
        if (!$value)
        {
            $value = $this->getOriginal('name');
        }
        if (!$value)
        {
            
            return $value;
        }
        $lang_front = config('strongshop.defaultLanguage');
        $arr = json_decode($value, true);
        if (!$arr)
        {
            return $value;
        }
        return $arr[$lang_front] ?? array_shift($arr);
    }

    public function children()
    {
        return $this->hasMany(self::class, 'parent_id', 'id')->orderByDesc('sort');
    }

    public function parent()
    {
        return $this->belongsTo(self::class, 'parent_id', 'id');
    }

}
