<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{

    use Notifiable;

    protected $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'api_token', 'wechat_open_id', 'wechat_union_id', 'qq_open_id', 'weibo_open_id', 'facebook_open_id', 'google_open_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

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
            'id' => '管理員id',
            'user_name' => '登錄名',
            'role_id' => '角色',
            'password' => '登錄密碼',
            'remember_token' => '記住登錄',
            'name' => '姓名',
            'email' => '郵箱',
            'phone' => '手機號',
            'avatar' => '頭像',
            'introduction' => '介紹',
            'status' => '狀態',
            'last_ip' => '最近一次登錄ip',
            'last_at' => '最近一次登錄時間',
            'created_at' => '新增時間',
            'updated_at' => '更新時間',
        ];
    }
}
