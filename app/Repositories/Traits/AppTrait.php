<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Repositories\Traits;

use App\Repositories\AppRepository;

/**
 * Description of AuthTrait
 * @property bool $isApi 是否是`api`路由組
 * @property bool $isWeb 是否是`web`路由組
 * @property User $user 登錄使用者對像
 * @property string $uuid uuid
 * @property User $guard 獲取登錄守護名稱
 * @author Administrator
 */
trait AppTrait
{

    /**
     * 是否是`api`路由組
     * @return bool
     */
    protected function getIsApi(): bool
    {
        return AppRepository::isApi();
    }

    /**
     * 是否是`web`路由組
     * @return bool
     */
    protected function getIsWeb(): bool
    {
        return AppRepository::isWeb();
    }

    /**
     * 獲取登錄使用者資訊
     * @return User
     */
    protected function getUser()
    {
        return AppRepository::getUser();
    }

    /**
     * 獲取 uuid
     * @return User
     */
    protected function getUuid()
    {
        return app('strongshop')->getUuid();
    }

    /**
     * 獲取登錄守護名稱
     * @return type
     */
    protected function getGuard()
    {
        return AppRepository::getGuard();
    }

    /**
     * 渲染檢視
     * @param type $view
     * @param type $data
     * @param type $mergeData
     * @return type
     */
    protected function view($view = null, $data = [], $mergeData = [])
    {
        return view($view, $data, $mergeData);
    }

    /**
     * 魔術方法
     * @param type $name
     * @return type
     */
    public function __get($name)
    {
        $action = 'get' . ucfirst($name);
        return $this->$action();
    }

}
