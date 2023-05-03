<style type="text/css">
    *{ font-size:12px !important;}
    .st-total{
        display: inline-block;
        width:90px;
        text-align: right;
    }
</style>
@foreach($rows as $row)
<h3 align="center" style="margin:0;padding:0;"><img width='200' src="/img/logo.272x92.png" /></h3>
<h2 align="center">Order Details</h2>
<table width="100%" cellpadding="1">
    <tbody>
        <tr>
            <td width="8%">@lang('Buyer'):</td>
            <td>{{$row->email}}<!-- 購貨人姓名 --></td>
            <td align="right">@lang('Order time'):</td>
            <td>{{$row->created_at}}<!-- 下訂單時間 --></td>
            <td align="right">@lang('Payment method'):</td>
            <td>{{$row->paymentOption->title}}<!-- 支付方式 --></td>
            <td align="right">@lang('Order NO.'):</td>
            <td>{{$row->order_no}}<!-- 訂單號 --></td>
        </tr>
        <tr>
            <td>@lang('Payment time'):</td>
            <td>{{$row->paid_at}}<!-- 付款時間 --></td>
            <td align="right">@lang('Shipping method'):</td>
            <td>{{$row->shippingOption->title}}<!-- 配送方式 --></td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>@lang('Consignee'):</td>
            <td colspan="7">
                {{$row->first_name}} {{$row->last_name}}  <!-- 收貨人姓名 -->
                @lang('Receipt address'):
                {{$row->address_line_1}} , {{$row->city}} @if($row->state) , {{$row->state}} @else , {{$row->state_other}} @endif , {{$row->country}}, ;<!-- 收貨人地址 -->
                {{$row->postal_code}}, <!-- 郵政編碼 -->
                {{$row->phone}}<!-- 聯繫電話 -->
            </td>
        </tr>
    </tbody>
</table>
<table style="border-collapse:collapse;border-color:#000;" width="100%" border="1">
    <tbody>
        <tr align="center">
            <td bgcolor="#cccccc">@lang('Item name')  <!-- 商品名稱 --></td>
            <td bgcolor="#cccccc">@lang('Item code') <!-- 商品貨號 --></td>
            <td bgcolor="#cccccc">@lang('Attribute')  <!-- 商品屬性 --></td>
            <td bgcolor="#cccccc">@lang('Price') <!-- 商品單價 --></td>
            <td bgcolor="#cccccc">@lang('Qty.')<!-- 商品數量 --></td>
            <td bgcolor="#cccccc">@lang('Subtotal')    <!-- 價格小計 --></td>
        </tr>
        @foreach($row->orderProducts as $orderProduct)
        <tr>
            <td>&nbsp;{{$orderProduct->title}}<!-- 商品名稱 --></td>
            <td>&nbsp;{{$orderProduct->sku}} <!-- 商品貨號 --></td>
            <td>
                @forelse($orderProduct->specs as $spec)
                {{$spec->name}}:{{$spec->value}} 
                @empty
                @endforelse
            </td>
            <td align="right">{{$row->currency_code}} {{$orderProduct->sale_price}}&nbsp;<!-- 商品單價 --></td>
            <td align="right">{{$orderProduct->qty}}&nbsp;<!-- 商品數量 --></td>
            <td align="right">{{$row->currency_code}} {{$orderProduct->subtotal}}&nbsp;<!-- 商品金額小計 --></td>
        </tr>
        @endforeach
    </tbody>
</table>
<table width="100%" border="0">
    <tbody>
        <tr align="right">
            <td>
                <!-- 商品總金額 -->
                @lang('Products Amount'): <span class="st-total">{{$row->currency_code}} {{$row->products_amount}}</span><br/>
                <!-- 配送費用 --> 
                @if($row->shipping_fee > 0)
                @lang('Shipping Cost'): <span class="st-total">{{$row->currency_code}} {{$row->shipping_fee}}</span><br/>
                @endif
                <!-- 支付手續費 --> 
                @if($row->handling_fee > 0)
                @lang('Handing Cost'): <span class="st-total">{{$row->currency_code}} {{$row->handling_fee}}</span><br/>
                @endif
                <!-- 稅收費用 --> 
                @if($row->tax_fee > 0)
                @lang('Tax Cost'): <span class="st-total">{{$row->currency_code}} {{$row->tax_fee}}</span><br/>
                @endif
                <!--積分使用-->
                @if($row->handing_cost > 0)
                @lang('Used Credits Amount'): <span class="st-total">{{$row->currency_code}} {{$row->used_credits_amount}}</span><br/>
                @endif
                <!--優惠金額-->
                @if($row->discount_amount > 0)
                @lang('Discount Amount'): <span class="st-total">{{$row->currency_code}} {{$row->discount_amount}}</span><br/>
                @endif
                <!--訂單金額|支付金額-->
                @lang('Order Total'): <span class="st-total">{{$row->currency_code}} {{$row->order_amount}}</span><br/>
            </td>
        </tr>
    </tbody>
</table>
<table width="100%" border="0">
    <tbody>
        @if($row->remark)
        <tr> <!-- 支付備註 -->
            <td><strong>@lang('Order Remark'):</strong> {{$row->remark}}</td>
        </tr>
        @endif
        <tr>
            <!-- 網店名稱, 網店地址, 網店URL以及聯繫電話 -->
            <td>{{config('app.name')}}（{{config('app.url')}}）</td>
            <td align="right">@lang('Print time'):{{now()}}&nbsp;&nbsp;&nbsp;Operator:{{auth('strongadmin')->user()->name}}</td>
        </tr>
    </tbody>
</table>
<div style="PAGE-BREAK-AFTER:always"></div>
@endforeach
