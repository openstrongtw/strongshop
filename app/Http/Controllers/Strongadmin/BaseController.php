<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */
/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Strongadmin;

use OpenStrong\StrongAdmin\Http\Controllers\BaseController as Controller;
use App;

class BaseController extends Controller
{

    public function __construct()
    {
        App::setLocale('zh-CN');
    }

    /**
     * 獲取登錄使用者資訊
     * @return User
     */
    protected function getUser()
    {
        return auth('strongadmin')->user();
    }

}
