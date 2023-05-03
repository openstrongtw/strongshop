<?php

/*
  |--------------------------------------------------------------------------
  | Web Routes
  |--------------------------------------------------------------------------
 */
Route::get('admin/home', function () {
    return redirect('strongadmin');
});
Route::any('/', 'HomeController@index')->name('home');
Route::get('/test', 'HomeController@test');

//登录
Route::get('login', 'Auth\LoginController@showLoginForm')->name('login')->middleware(['guest']);
Route::post('login', 'Auth\LoginController@login');
Route::post('login/code', 'Auth\LoginController@loginCode')->middleware(['throttle:3,1']); //获取验证码
//登出
Route::get('logout', 'Auth\LoginController@logout')->name('logout');
//注册
Route::get('register', 'Auth\RegisterController@showRegisterForm')->name('register')->middleware('guest');
Route::post('register', 'Auth\RegisterController@register')->middleware(['throttle:5,1', 'guest']);
Route::get('register/captcha', 'Auth\RegisterController@captcha')->name('register.captcha');
Route::get('register/success', 'Auth\RegisterController@registerSuccess')->name('register.success');
//重置密码
Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
Route::post('password/reset', 'Auth\ResetPasswordController@reset')->name('password.update');
//确认密码
Route::get('password/confirm', 'Auth\ConfirmPasswordController@showConfirmForm')->name('password.confirm');
Route::post('password/confirm', 'Auth\ConfirmPasswordController@confirm');
//邮箱验证
Route::get('email/verify', 'Auth\VerificationController@show')->name('verification.notice');
Route::get('email/verify/{id}/{hash}', 'Auth\VerificationController@verify')->name('verification.verify');
Route::post('email/resend', 'Auth\VerificationController@resend')->name('verification.resend');
//产品列表
Route::get('product/category', 'Product\ProductController@index')->name('product.list');
Route::get('category-{catid}.html', 'Product\ProductController@index')->name('product.list.rewrite'); //url rewrite
//产品搜索
Route::get('product/search', 'Product\ProductController@search')->name('product.search');
//产品详情
Route::get('product-{id}.html', 'Product\ProductController@show')->name('product.show.rewrite'); //url rewrite
Route::get('product-{id}', 'Product\ProductController@show'); //url rewrite
Route::get('product', 'Product\ProductController@show')->name('product.show');
Route::post('product/collect', 'Product\ProductController@collect')->middleware(['auth:web']); //收藏产品
//产品评论
Route::get('comment/list', 'Product\CommentController@list')->name('comment.list');
Route::any('comment/create', 'Product\CommentController@create')->name('comment.create')->middleware(['auth:web']);
Route::post('comment/upload/picture', 'Common\UploadController@imageForWork')->middleware(['auth:web']);
Route::get('comment/search/product', 'Product\CommentController@searchProduct');
//购物车
Route::get('shoppingcart', 'Product\ShoppingCartController@showIndexForm')->name('shoppingcart'); //购物车页
Route::get('shoppingcart/fetchNavcartHtml', 'Product\ShoppingCartController@fetchShoppingcartHtml'); //顶部导航购物车html
Route::get('shoppingcart/fetchShoppingcartHtml', 'Product\ShoppingCartController@fetchShoppingcartHtml')->name('shoppingcart.fetchShoppingcartHtml'); //购物车html
Route::get('shoppingcart/products', 'Product\ShoppingCartController@products'); //购物车产品
Route::post('shoppingcart/create', 'Product\ShoppingCartController@create'); //添加/更新购物车
Route::post('shoppingcart/update', 'Product\ShoppingCartController@update'); //更新购物车
Route::post('shoppingcart/remove', 'Product\ShoppingCartController@remove'); //移除购物车产品
Route::get('shoppingcart/checkout', 'Product\CheckoutController@showIndexForm')->name('shoppingcart.checkout')->middleware('auth:web'); //结算页
Route::post('shoppingcart/checkout/createOrder', 'Product\CheckoutController@createOrder')->name('shoppingcart.createOrder')->middleware('auth:web'); //创建订单
Route::get('payment/pay', 'Payment\IndexController@index')->name('payment.pay')->middleware('auth:web');//支付
//购物车订单费用合计/总计
Route::post('shoppingcart/ordertotal', 'Product\CheckoutController@orderTotal');
//订单跟踪
Route::any('user/order/tracking', 'User\OrderController@orderTracking')->name('user.orderTracking');
//地区
Route::get('common/region/states', 'Common\RegionController@states');
//配送方式列表
Route::get('shoppingcart/shippingoptions', 'Product\CheckoutController@getShippingOptions');
//paypal 支付
Route::any('payment/paypal/return', 'Payment\PaypalController@successReturn')->name('paypal.return'); //支付成功后返回页面
Route::post('payment/paypal/notify', 'Payment\PaypalController@notify')->name('paypal.notify'); //paypal 回调
Route::get('payment/paypal/pay', 'Payment\PaypalController@payStandard')->name('paypal.pay')->middleware('auth:web'); //paypal 支付
//文章
Route::get('article/list', 'ArticleController@index')->name('article.index'); //列表
Route::get('article', 'ArticleController@show')->name('article.show'); //详情
Route::get('article-{id}.html', 'ArticleController@show')->name('article.show.rewrite');
Route::get('article/{postid}', 'ArticleController@show')->name('article.show.postid'); //根据postid唯一表示查找文章详情
//auth
Route::middleware(['auth:web'])->group(function () {
    //个人中心
    Route::get('user/index', 'User\UserController@index')->name('user.index'); //用户首页
    Route::get('user/account', 'User\UserController@account')->name('user.my.account'); //我的账号
    Route::post('user/update', 'User\UserController@update')->name('user.my.account.update'); //更新个人信息
    Route::post('user/email/resendVerify', 'User\UserController@resendEmailVerification')->middleware(['throttle:3,1']); //重新发送email验证
    Route::get('user/collects', 'User\UserController@collects')->name('user.my.collects'); //我的收藏
    Route::post('user/collects/remove', 'User\UserController@removeCollects'); //移除收藏
    //订单
    Route::get('user/orders', 'User\OrderController@orders')->name('user.my.orders'); //我的订单
    Route::get('user/order/detail', 'User\OrderController@orderDetail')->name('user.my.order.detail'); //我的订单-详情
    Route::post('user/order/cancel', 'User\OrderController@cancelOrder'); //取消订单
    Route::post('user/order/receive', 'User\OrderController@receiveOrder'); //确认收货
    //意见反馈
    Route::get('user/feedback/index', 'User\FeedbackController@index')->name('user.my.feedback'); //我的反馈
    Route::match(['get', 'post'], 'user/feedback/create', 'User\FeedbackController@create')->name('user.my.feedback.create')->middleware(['throttle:3,1']); //提交反馈
    Route::match(['get', 'post'], 'user/feedback/replies', 'User\FeedbackController@replies')->name('user.my.feedback.reylies'); //回复列表
});

Route::get('auth/facebook', 'Auth\Socialite\FacebookController@redirectToProvider')->name('auth.facebook');
Route::get('auth/facebook/callback', 'Auth\Socialite\FacebookController@handleProviderCallback')->name('auth.facebook.callback');
Route::get('auth/google', 'Auth\Socialite\GoogleController@redirectToProvider')->name('auth.google');
Route::get('auth/google/callback', 'Auth\Socialite\GoogleController@handleProviderCallback')->name('auth.google.callback');

Route::get('payment/paondelivery/pay', 'Payment\PayondeliveryController@index')->name('paondelivery.pay')->middleware('auth:web'); //货到付款