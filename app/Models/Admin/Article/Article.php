<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Admin\Article;

use App\Models\BaseModel as Model;
use App\Models\Admin\Product\Category;

class Article extends Model
{

    use \Illuminate\Database\Eloquent\SoftDeletes;

    public $tableComments = '文章表';
    protected $table = 'article';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        $data = [
            'category_id' => ['required', 'integer', 'min:1'],
            'title' => ['required', 'string', 'max:100'],
            'postid' => ['nullable', 'string', 'max:100'],
            'cover_img' => ['nullable', 'string', 'max:255'],
            'content' => ['required', 'string', 'max:65535'],
            'author' => ['nullable', 'string', 'max:255'],
            'status' => ['required', 'integer'],
            'sort' => ['integer'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
            'deleted_at' => ['date'],
            'meta_keywords' => ['nullable', 'string', 'max:255'],
            'meta_description' => ['nullable', 'string', 'max:255'],
        ];
        if (config('strongshop.multiLanguageBackend'))
        {
            $lang_front = config('strongshop.defaultLanguage');

            $data['title'] = ['required', 'array', 'max:99'];
            $data['title.' . $lang_front] = ['required', 'string', 'max:255'];

            $data['content'] = ['required', 'array', 'max:99'];
            $data['content.' . $lang_front] = ['required', 'string', 'max:65535'];
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
            'id' => 'ID',
            'category_id' => '分類',
            'title' => '標題',
            'postid' => '唯一標識',
            'cover_img' => '封面圖',
            'content' => '內容',
            'author' => '作者',
            'status' => '狀態',
            'sort' => '排序',
            'created_at' => '建立時間',
            'updated_at' => '更新時間',
            'deleted_at' => '刪除時間',
            'meta_keywords' => 'meta',
            'meta_description' => 'meta',
            'origin' => '內容來源',
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

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function setTitleAttribute($value)
    {
        if (is_array($value))
        {
            $value = json_encode($value);
        }
        $this->attributes['title'] = $value;
    }

    public function getTitleAttribute($value)
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
    public function getTitleLabelAttribute($value)
    {
        if (!$value)
        {
            $value = $this->getOriginal('title');
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

    public function setContentAttribute($value)
    {
        if (is_array($value))
        {
            $value = json_encode($value);
        }
        $this->attributes['content'] = $value;
    }

    public function getContentAttribute($value)
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

    public function getAuthorAttribute($value)
    {
        if (!$value)
        {
            return config('app.name');
        }
        return $value;
    }

}
