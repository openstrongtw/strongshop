<?php

/*
  |--------------------------------------------------------------------------
  | API Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register API routes for your application. These
  | routes are loaded by the RouteServiceProvider within a group which
  | is assigned the "api" middleware group. Enjoy building your API!
  |
 */


//登录
Route::any('login', 'Auth\LoginController@login');
Route::any('login/code', 'Auth\LoginController@loginCode')->middleware(['throttle:3,1']); //获取验证码
//登出
Route::any('logout', 'Auth\LoginController@logout');
//注册
Route::any('register', 'Auth\RegisterController@register')->middleware(['throttle:10,1', 'guest']);
//重置密码
Route::any('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail');
Route::any('password/reset', 'Auth\ResetPasswordController@reset');
//刷新token
Route::any('user/refreshtoken', 'User\UserController@refreshToken')->middleware('auth:api');
//验证邮箱
Route::any('email/verify/{id}/{hash}', 'Auth\VerificationController@verifyForApi')->middleware('auth:api');
//地区
Route::any('common/region/countries', 'Common\RegionController@countries');
Route::any('common/region/states', 'Common\RegionController@states');
//首页信息
Route::any('home/index', 'HomeController@index');
//产品分类
Route::any('product/category', 'Product\CategoryController@index');
//产品列表
Route::any('product/index', 'Product\ProductController@index');
//产品搜索
Route::any('product/search', 'Product\ProductController@search');
//产品详情
Route::any('product', 'Product\ProductController@show')->name('product.show');
Route::any('product/collect', 'Product\ProductController@collect')->middleware(['auth:api']); //收藏产品
//购物车
Route::any('shoppingcart/show', 'Product\ShoppingCartController@show'); //购物车详情
Route::any('shoppingcart/create', 'Product\ShoppingCartController@create'); //添加购物车
Route::any('shoppingcart/update', 'Product\ShoppingCartController@update'); //更新购物车
Route::any('shoppingcart/remove', 'Product\ShoppingCartController@remove'); //移除购物车产品
//配送方式列表
Route::any('shoppingcart/shippingoptions', 'Product\CheckoutController@getShippingOptions');
//支付方式列表
Route::any('shoppingcart/paymentoptions', 'Product\CheckoutController@getPaymentOptions');
//下单
Route::any('shoppingcart/checkout/createOrder', 'Product\CheckoutController@createOrder');
//费用合计、总计
Route::any('shoppingcart/ordertotal', 'Product\CheckoutController@orderTotal');
//paypal
Route::any('payment/paypal/payinfo', 'Payment\PaypalController@payinfo')->middleware('auth:api'); //paypal 支付订单信息
Route::any('payment/paypal/notify', 'Payment\PaypalController@notify'); //paypal 异步通知
//文章
Route::any('article/list', 'ArticleController@index'); //列表
Route::any('article', 'ArticleController@show'); //详情
//个人中心
Route::middleware(['auth:api'])->group(function () {
    Route::any('user/account', 'User\UserController@account'); //我的账号
    Route::any('user/email/resendVerify', 'User\UserController@resendEmailVerification')->middleware(['throttle:3,1']); //重新发送email验证
    Route::any('user/update', 'User\UserController@update'); //更新个人信息
    Route::any('user/collects', 'User\UserController@collects'); //我的收藏
    Route::any('user/collects/remove', 'User\UserController@removeCollects'); //移除收藏
    //订单
    Route::any('user/orders', 'User\OrderController@orders'); //我的订单
    Route::any('user/order/detail', 'User\OrderController@orderDetail'); //订单详情
    Route::any('user/order/cancel', 'User\OrderController@cancelOrder'); //取消订单
    Route::any('user/order/receive', 'User\OrderController@receiveOrder'); //确认收货
    //意见反馈
    Route::any('user/feedback/index', 'User\FeedbackController@index'); //我的反馈
    Route::any('user/feedback/create', 'User\FeedbackController@create')->middleware(['throttle:3,1']); //提交反馈
    Route::any('user/feedback/replies', 'User\FeedbackController@replies'); //回复列表
});
