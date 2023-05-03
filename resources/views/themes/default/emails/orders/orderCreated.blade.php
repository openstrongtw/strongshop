@component('mail::message')
Hello, {{$order->first_name}}:

Your order[ <a href="{{route('user.my.order.detail', ['orderId'=>$order->id])}}">{{$order->order_no}}</a> ] has been produced, please complete payment as soon as possible.

@component('mail::button', ['url' => route('user.my.feedback')])
Feedback Us
@endcomponent

@component('mail::table')
|@lang('Item Name')        |@lang('Item Price') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;         |@lang('Item Qty.')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| :------------- |:-------------|:-------------|
@foreach($order->orderProducts as $product)
| {{$product->title}}     | {{$product->currency_code}} {{$product->sale_price}}      |{{$product->qty}}|
@endforeach
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
