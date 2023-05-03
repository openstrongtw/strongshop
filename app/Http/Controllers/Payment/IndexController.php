<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Payment;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PaymentOption;

class IndexController extends Controller
{

    public function index(Request $request)
    {
        //支付方式
        $payment = PaymentOption::where('status', 1)->where('code', $request->paycode)->exists();
        if (!$payment)
        {
            abort(201, __('Payment not exists.'));
        }
        $url = route("{$request->paycode}.pay", ['orderId' => $request->orderId]);
        return redirect($url);
    }

}
