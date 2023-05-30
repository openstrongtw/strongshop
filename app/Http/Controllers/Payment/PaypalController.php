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
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;
use PayPal\Api\Payer;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Details;
use PayPal\Api\Amount;
use PayPal\Api\Transaction;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Payment;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Rest\ApiContext;
use App\Models\Order\Order;
use PayPal\Api\PaymentExecution;
use PayPal\Api\ShippingAddress;
use App\Repositories\OrderRepository;
use App\Repositories\AppRepository;
use App\Models\PaymentOption;

class PaypalController extends Controller
{

    /**
     * 表單提交支付
     * @param type $orderId
     */
    public function payStandard(Request $request)
    {
        $orderId = $request->orderId;
        //訂單資訊
        $order = Order::query()->where('id', $orderId)
                ->with('orderProducts')
                ->first();
        if (!$order)
        {
            abort(404);
        }
        if (!in_array($order->order_status, [Order::STATUS_UNPAID, Order::STATUS_PAY_FAILED]))
        {
            abort(201, __('Invalid'));
        }

        $model = PaymentOption::where('code', 'paypal')->where('status', 1)->first();
        if (!$model)
        {
            abort(201, __('Payment not exists'));
        }

        $cancel_url = route('home');
        $return_url = route('paypal.return');
        $notify_url = config('strongshop.payment.paypal.notify_url') ?: route('paypal.notify');
        //收款帳號
        $business = $model->more['business'] ?? config('strongshop.payment.paypal.business');
        //預設設定結算貨幣
        $defaultCurrencyPay = isset($model->more['currency']) || $model->more['currency'] == null ? $model->more['currency'] : config('strongshop.defaultCurrencyPay');
        //環境
        $env = $model->more['env'] ?? config('strongshop.env');

        $description = config('app.name'); //訂單描述
        $currency = $order->currency_code; //訂單貨幣
        $currency_rate = $order->currency_rate; //訂單貨幣費率
        $invoiceNumber = $order->order_no; //訂單號
        $total = $order->order_amount; //支付總額

        /*
         * 如果`預設設定結算貨幣`和`訂單貨幣`不一致，則強制轉換為 `預設設定結算貨幣`
         */
        if ($defaultCurrencyPay && $defaultCurrencyPay !== $currency)
        {
            $currency = $defaultCurrencyPay;
            $total = AppRepository::convertCurrencyToDefault($total, $currency_rate);
        }

        if ($env === 'live')
        {
            $url = 'https://www.paypal.com/cgi-bin/webscr';
        } elseif ($env === 'sandbox')
        {
            $url = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
        } else
        {
            $url = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
        }

        $def_form = "<form action='{$url}' method='post'>";
        $def_form .= "<input type='hidden' name='cmd' value='_xclick'>" . // 不能省略
                "<input type='hidden' name='business' value='{$business}'>" . // 貝寶帳號
                "<input type='hidden' name='item_name' value='{$description}'>" . // payment for
                "<input type='hidden' name='amount' value='{$total}'>" . // 訂單金額
                "<input type='hidden' name='currency_code' value='{$currency}'>" . // 貨幣
                "<input type='hidden' name='return' value='{$return_url}'>" . // 付款后頁面
                "<input type='hidden' name='invoice' value='{$invoiceNumber}'>" . // 訂單號
                "<input type='hidden' name='charset' value='utf-8'>" . // 字符集
                "<input type='hidden' name='no_shipping' value='1'>" . // 不要求客戶提供收貨地址
                "<input type='hidden' name='no_note' value=''>" . // 付款說明
                "<input type='hidden' name='notify_url' value='{$notify_url}'>" .
                "<input type='hidden' name='rm' value='2'>" .
                "<input type='hidden' name='cancel_return' value='$cancel_url'>";
        $def_form .= "<input type='submit' value='Pay With PayPal'>";                      // 按鈕
        $def_form .= "</form>";

        return view('shoppingcart.pay', ['def_form' => $def_form]);
    }

    /**
     * 支付成功后返回頁面
     * @param Request $request
     */
    public function successReturn(Request $request)
    {
        if ($request->post('payment_status') === 'Completed')
        {
            abort(200, __('Pay Success'));
        }
        return redirect('/');
    }

    /**
     * 非同步通知
     * @param Request $request
     * @return boolean
     */
    public function notify(Request $request)
    {
        if ($request->post('payment_status') !== 'Completed')
        {
            return '';
        }
        $data = $request->post();

        if (config('app.debug') || env('PAYMENT_LOG'))
        {
            Log::channel('paypal')->debug('paypal check res begin');
            Log::channel('paypal')->debug('notify data', $data);
        }

        $order_no = $request->post('invoice');
        $transaction_id = $request->post('txn_id');
        $paid_amount = $request->post('mc_gross'); //實際支付金額
        $paid_currency = $request->post('mc_currency'); //實際支付貨幣

        $req = 'cmd=_notify-validate';
        foreach ($data as $key => $value)
        {
            $value = urlencode($value);
            $req .= "&$key=$value";
        }
        if (\App::environment(['production']))
        {
            $url = 'https://www.paypal.com/cgi-bin/webscr?' . $req;
        } else
        {
            $url = 'https://www.sandbox.paypal.com/cgi-bin/webscr?' . $req;
        }

        if (config('app.debug') || env('PAYMENT_LOG'))
        {
            Log::channel('paypal')->debug('paypal check res url:' . $url);
        }

        $verifyReturn = $this->curlGet($url);

        if (config('app.debug') || env('PAYMENT_LOG'))
        {
            Log::channel('paypal')->debug('paypal check res:' . $verifyReturn);
        }

        if ($verifyReturn == 'VERIFIED')
        {
            OrderRepository::paid($order_no, $transaction_id, $paid_amount, $paid_currency);
            return 'success';
        }
        return 'failed';
    }

    /**
     * 支付訂單資訊
     * @param type $orderId
     */
    public function payinfo(Request $request)
    {
        $rules = [
            'order_id' => ['required', 'exists:order,id'],
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        //訂單資訊
        $order = Order::find($request->order_id);
        if (!in_array($order->order_status, [Order::STATUS_UNPAID, Order::STATUS_PAY_FAILED]))
        {
            return ['code' => 4001, 'message' => 'Order invliad.'];
        }

        $model = PaymentOption::where('code', 'paypal')->where('status', 1)->first();
        if (!$model)
        {
            return ['code' => 4002, 'message' => 'Payment not exists'];
        }

        $cancel_url = config('app.url');
        $return_url = route('paypal.return');
        $notify_url = config('strongshop.payment.paypal.notify_url', route('paypal.notify'));
        //收款賬號
        $business = $model->more['business'] ?? config('strongshop.payment.paypal.business');
        //預設設定結算貨幣
        $defaultCurrencyPay = isset($model->more['currency']) || $model->more['currency'] == null ? $model->more['currency'] : config('strongshop.defaultCurrencyPay');
        //環境
        $env = $model->more['env'] ?? config('strongshop.env');

        $description = config('app.name'); //訂單描述
        $currency = $order->currency_code; //訂單貨幣
        $currency_rate = $order->currency_rate; //訂單貨幣費率
        $invoiceNumber = $order->order_no; //訂單號
        $total = $order->order_amount; //支付總額

        /*
         * 如果`預設設定結算貨幣`和`訂單貨幣`不一致，則強制轉換為 `預設設定結算貨幣`
         */
        if ($defaultCurrencyPay && $defaultCurrencyPay !== $currency)
        {
            $currency = $defaultCurrencyPay;
            $total = AppRepository::convertCurrencyToDefault($total, $currency_rate);
        }

        if ($env === 'live')
        {
            $url = 'https://www.paypal.com/cgi-bin/webscr';
        } elseif ($env === 'sandbox')
        {
            $url = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
        } else
        {
            $url = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
        }

        $def_form = "<form action='{$url}' method='post'>";
        $def_form .= "<input type='hidden' name='cmd' value='_xclick'>" . // 不能省略
                "<input type='hidden' name='business' value='{$business}'>" . // 貝寶帳號
                "<input type='hidden' name='item_name' value='{$description}'>" . // payment for
                "<input type='hidden' name='amount' value='{$total}'>" . // 訂單金額
                "<input type='hidden' name='currency_code' value='{$currency}'>" . // 貨幣
                "<input type='hidden' name='return' value='{$return_url}'>" . // 付款后頁面
                "<input type='hidden' name='invoice' value='{$invoiceNumber}'>" . // 訂單號
                "<input type='hidden' name='charset' value='utf-8'>" . // 字符集
                "<input type='hidden' name='no_shipping' value='1'>" . // 不要求客戶提供收貨地址
                "<input type='hidden' name='no_note' value=''>" . // 付款說明
                "<input type='hidden' name='notify_url' value='{$notify_url}'>" .
                "<input type='hidden' name='rm' value='2'>" .
                "<input type='hidden' name='cancel_return' value='$cancel_url'>";
        $def_form .= "<input type='submit' value='Pay With PayPal'>";                      // 按鈕
        $def_form .= "</form>";

        return [
            'code' => 200,
            'message' => 'Success',
            'data' => [
                'form' => $def_form,
                'pay' => [],
            ]
        ];
    }

    protected function curlGet($url, $i = 0)
    {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); //這個是重點。
        $httpResponse = curl_exec($ch);
        if (!$httpResponse)
        {
            $i++;
            if ($i <= 5)
            {
                return $this->curlGet($url, $i);
            } else
            {
                return $httpResponse;
            }
        }

        return $httpResponse;
    }

    /**
     * restApi方式支付
     * @param type $orderId
     */
    public function pay($orderId)
    {
        $clientId = config('strongshop.payment.paypal.clientId'); //ID
        $clientSecret = config('strongshop.payment.paypal.clientSecret'); //秘鑰
        $return_url = route('paypal.callback'); //返回地址
        //訂單資訊
        $order = Order::query()->where('id', $orderId)
                ->with('orderProducts')
                ->first();
        if (!$order)
        {
            abort(404);
        }
        if (!in_array($order->order_status, [Order::STATUS_UNPAID, Order::STATUS_PAY_FAILED]))
        {
            abort(201, __('Invalid'));
        }
        $apiContext = new ApiContext(new OAuthTokenCredential($clientId, $clientSecret));

        if (\App::environment(['production']))
        {
            //如果是沙盒測試環境不設定，請註釋掉
            $apiContext->setConfig(
                    array(
                        'mode' => 'live',
                    )
            );
        }

        $currency = $order->currency_code; //貨幣
        $invoiceNumber = $order->order_no; //訂單號
        $price = $order->products_amount; //產品金額
        $shipping = $order->shipping_fee; //運費
        $description = config('app.name'); //訂單描述
        $total = $order->order_amount; //支付總額

        $address = new ShippingAddress();
        $address->setRecipientName($order->first_name) //買家名
                ->setLine1($order->address_line_1)//地址
                ->setLine2($order->address_line_2)//詳情地址
                ->setCity($order->city)//城市名
                ->setState($order->state ?: $order->state_other)//省份
                ->setPhone($order->phone)//手機號碼
                ->setPostalCode($order->postal_code)//郵政編碼
                ->setCountryCode($order->country_code); //國家編號

        $itemList = new ItemList();
        $itemList->setShippingAddress($address);
        foreach ($order->orderProducts as $product)
        {
            $item = new Item();
            $item->setName($product['title'])->setCurrency($currency)->setQuantity($product['qty'])->setPrice($product['sale_price']);
            $itemList->addItem($item);
        }

        $payer = new Payer();
        $payer->setPaymentMethod('paypal');

        $details = new Details();
        $details->setSubtotal($price)->setShipping($shipping)->setHandlingFee($order->handling_fee);

        $amount = new Amount();
        $amount->setCurrency($currency)
                //->setDetails($details)
                ->setTotal($total);

        $transaction = new Transaction();
        $transaction->setInvoiceNumber($invoiceNumber)
                ->setAmount($amount)
                //->setItemList($itemList)
                ->setDescription($description);

        $redirectUrls = new RedirectUrls();
        $redirectUrls->setReturnUrl($return_url . '?success=true')->setCancelUrl($return_url . '/?success=false');

        $payment = new Payment();
        $payment->setIntent('sale')->setPayer($payer)->setRedirectUrls($redirectUrls)->setTransactions([$transaction]);
        $payment->create($apiContext);
        $approvalUrl = $payment->getApprovalLink();
        header("Location: {$approvalUrl}");
    }

    public function callback(Request $request)
    {
        if ($request->success == 'false')
        {
            return redirect('/');
        }
        $clientId = config('strongshop.payment.paypal.clientId'); //ID
        $clientSecret = config('strongshop.payment.paypal.clientSecret'); //秘鑰
        $apiContext = new ApiContext(new OAuthTokenCredential($clientId, $clientSecret));
        $paymentId = $request->paymentId;
        $PayerID = $request->PayerID;

        $payment = Payment::get($paymentId, $apiContext);
        $execute = new PaymentExecution();
        $execute->setPayerId($PayerID);
        $payment->execute($execute, $apiContext); //執行請求paypal支付資訊

        $data = $payment->toArray();
        $order_no = $data['transactions'][0]['invoice_number'] ?? ''; //訂單號
        $transaction_id = $data['transactions'][0]['related_resources'][0]['sale']['id'] ?? ''; //交易流水號
        $transaction_status = $data['transactions'][0]['related_resources'][0]['sale']['state'] ?? ''; //交易狀態
        $paid_amount = $data['transactions'][0]['amount']['total'] ?? ''; //支付金額
        if ($payment->getState() === 'approved')
        {
            if ($transaction_status === 'completed')
            {
                // 支付完成
                OrderRepository::paid($order_no, $transaction_id, $paid_amount);
                abort(200, __('Pay Success'));
            }
            OrderRepository ::exception($order_no, '支付異常：' . $transaction_status); //當出現支付異常，請登錄paypal平臺檢視對應訂單狀態
            abort(201, __('Pay :status ...', ['status' => $transaction_status]));
        }

        //支付失敗
        OrderRepository::failed($order_no);
        abort(201, __('Pay Failed'));
    }

}
