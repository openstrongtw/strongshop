<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order\Order;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{

    public function orders()
    {
        $rows = Order::query()
                ->orderByDesc('id')
                ->where('user_id', $this->user->id)
                ->select('id', 'order_no', 'currency_code', 'order_amount', 'order_status', 'created_at', 'payment_option_id')
                ->with('orderProducts:product_id,order_id,sku,title,sale_price,qty,img_cover,specs')
                ->with('paymentOption:id,code')
                ->paginate(5);
        if ($this->isApi)
        {
            return ['code' => 200, 'message' => 'Success', 'data' => $rows];
        }
        return view('user.orders', ['rows' => $rows]);
    }

    public function orderDetail(Request $request)
    {
        $rules = [
            'orderId' => ['required', 'exists:order,id'],
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }

        $row = Order::query()
                ->where('user_id', $this->user->id)
                ->where('id', $request->orderId)
                ->with('orderProducts:product_id,order_id,sku,title,sale_price,qty,img_cover,specs')
                ->with('shippingOption:id,title,code,desc')
                ->with('paymentOption:id,title,code,desc')
                ->first();
        $row->makeHidden(['order_status_style', 'http_referer', 'source', 'deleted_at']);
        if ($this->isApi)
        {
            return ['code' => 200, 'message' => 'Success', 'data' => $row];
        }
        return view('user.orderDetail', ['row' => $row]);
    }

    public function orderTracking(Request $request)
    {
        if ($request->isMethod('post'))
        {
            $rules = [
                'order_no' => ['required', 'string', Rule::exists('order', 'order_no')->whereNull('deleted_at')],
            ];
            $validator = Validator::make($request->all(), $rules);
        } else
        {
            $validator = null;
        }

        $row = Order::query()
                ->where('order_no', $request->order_no)
                ->first();
        return view('user.orderTracking', ['row' => $row])->withErrors($validator);
    }

    public function cancelOrder(Request $request)
    {
        $rules = [
            'order_id' => ['required', 'integer', Rule::exists('order', 'id')->where('user_id', $this->user->id)->where('order_status', Order::STATUS_UNPAID)->whereNull('deleted_at')],
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = Order::find($request->order_id);
        $model->order_status = Order::STATUS_CANCELED;
        $model->canceled_at = now();
        $model->save();

        event(new \App\Events\OrderCanceled($model));

        return ['code' => 200, 'message' => __('Success')];
    }

    public function receiveOrder(Request $request)
    {
        $rules = [
            'order_id' => ['required', 'integer', Rule::exists('order', 'id')->where('user_id', $this->user->id)->where('order_status', Order::STATUS_SHIPPED)->whereNull('deleted_at')],
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = Order::find($request->order_id);
        $model->order_status = Order::STATUS_RECEIVED;
        $model->received_at = now();
        $model->save();

        event(new \App\Events\OrderReceived($model));

        return ['code' => 200, 'message' => __('Success')];
    }

}
