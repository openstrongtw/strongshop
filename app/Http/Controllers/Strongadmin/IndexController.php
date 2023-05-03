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

use Illuminate\Http\Request;
use App\Models\Admin\Order\Order;
use App\Models\UserFeedback;
use App\Models\Admin\Product\Product;
use App\Facades\Strongshop;
use App\Models\User;
use App\Models\Product\ProductComment;
use Illuminate\Support\Facades\DB;

class IndexController extends \OpenStrong\StrongAdmin\Http\Controllers\IndexController
{

    /**
     * 面板
     * @return type
     */
    public function panel()
    {
        $order_count_paid = Order::where('order_status', Order::STATUS_PAID)->count(); //待發貨
        $order_count_unpaid = Order::where('order_status', Order::STATUS_UNPAID)->count(); //待付款
        $order_count_today = Order::whereBetween('created_at', [now()->startOfDay(), now()->endOfDay()])->count(); //今日訂單
        $userfeedback_noreply_count = UserFeedback::where('parent_id', 0)->where('status', 1)->count(); //待回覆反饋
        $product_stock_warning = Product::where('stock', '<=', 5)->count(); //產品庫存警告
        //數據總計
        $total = [
            'users' => User::count(),
            'products' => Product::count(),
            'orders' => Order::count(),
            'product_comments' => ProductComment::count(),
        ];
        //環境和版本資訊
        $version = [
            'os' => php_uname('s') . ' ' . php_uname('r') . ' ' . php_uname('m'), //操作系統
            'strongshop' => Strongshop::getVersion(), //strongshop 系統
            'php' => PHP_VERSION,
            'nginx' => $_SERVER['SERVER_SOFTWARE'] ?? '',
            'mysql' => DB::connection()->getPdo()->getAttribute(\PDO::ATTR_SERVER_VERSION),
            'laravel' => app()->version(),
            'app.name' => config('app.name'),
            'app.env' => config('app.env'),
            'app.debug' => config('app.debug'),
        ];
        return $this->view('index.panel', [
                    'order_count_paid' => $order_count_paid,
                    'order_count_unpaid' => $order_count_unpaid,
                    'order_count_today' => $order_count_today,
                    'userfeedback_noreply_count' => $userfeedback_noreply_count,
                    'product_stock_warning' => $product_stock_warning,
                    'version' => $version,
                    'total' => $total,
        ]);
    }

}
