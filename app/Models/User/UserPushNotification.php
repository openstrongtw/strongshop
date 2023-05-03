<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\User;

use App\Models\BaseModel as Model;
use OpenStrong\StrongAdmin\Models\AdminUser;

class UserPushNotification extends Model
{

    public $tableComments = '會員發送通知（郵件）記錄表';
    protected $table = 'user_push_notification';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at', 'send_at'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'type' => ['integer'],
            'title' => ['required', 'string', 'max:255'],
            'content' => ['required', 'string', 'max:4294967295'],
            'admin_id' => ['integer'],
            'send_at' => ['date'],
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
            'type' => '通知型別',
            'title' => '標題',
            'content' => '內容',
            'admin_id' => '操作者',
            'send_at' => '發送時間',
            'status' => '發送狀態',
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

    public function adminUser()
    {
        return $this->belongsTo(AdminUser::class, 'admin_id');
    }

}
