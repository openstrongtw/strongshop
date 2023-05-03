<?php

/*
  |--------------------------------------------------------------------------
  | Admin Routes
  |--------------------------------------------------------------------------
  |
 */

Route::get('index/panel', 'Strongadmin\IndexController@panel'); //面板
//上传
Route::post('upload/image', 'Common\UploadController@image'); //上传图片
Route::post('upload/image/wangeditor', 'Common\UploadController@imageWangEditor'); //富文本图片上传【wangEditor】
//产品管理
Route::any('product/index', 'Strongadmin\Product\ProductController@index');
Route::any('product/show', 'Strongadmin\Product\ProductController@show');
Route::any('product/create', 'Strongadmin\Product\ProductController@create')->name('product.create');
Route::any('product/update', 'Strongadmin\Product\ProductController@update');
Route::any('product/destroy', 'Strongadmin\Product\ProductController@destroy');
Route::any('product/copy', 'Strongadmin\Product\ProductController@copy');
Route::any('product/spec/htmlString', 'Strongadmin\Product\ProductController@specHtmlString');
//产品分类
Route::any('product/category/index', 'Strongadmin\Product\CategoryController@index');
Route::any('product/category/show', 'Strongadmin\Product\CategoryController@show');
Route::any('product/category/create', 'Strongadmin\Product\CategoryController@create');
Route::any('product/category/update', 'Strongadmin\Product\CategoryController@update');
Route::any('product/category/destroy', 'Strongadmin\Product\CategoryController@destroy');
//产品规格组
Route::any('product/specGroup/index', 'Strongadmin\Product\SpecGroupController@index');
Route::any('product/specGroup/show', 'Strongadmin\Product\SpecGroupController@show');
Route::any('product/specGroup/create', 'Strongadmin\Product\SpecGroupController@create');
Route::any('product/specGroup/update', 'Strongadmin\Product\SpecGroupController@update');
Route::any('product/specGroup/destroy', 'Strongadmin\Product\SpecGroupController@destroy');
//产品规格
Route::any('product/spec/index', 'Strongadmin\Product\SpecController@index');
Route::any('product/spec/show', 'Strongadmin\Product\SpecController@show');
Route::any('product/spec/create', 'Strongadmin\Product\SpecController@create');
Route::any('product/spec/update', 'Strongadmin\Product\SpecController@update');
Route::any('product/spec/destroy', 'Strongadmin\Product\SpecController@destroy');
//产品品牌
Route::any('product/brand/index', 'Strongadmin\Product\BrandController@index');
Route::any('product/brand/show', 'Strongadmin\Product\BrandController@show');
Route::any('product/brand/create', 'Strongadmin\Product\BrandController@create');
Route::any('product/brand/update', 'Strongadmin\Product\BrandController@update');
Route::any('product/brand/destroy', 'Strongadmin\Product\BrandController@destroy');
//订单管理
Route::any('order/index', 'Strongadmin\OrderController@index');
Route::any('order/show', 'Strongadmin\OrderController@show');
Route::any('order/create', 'Strongadmin\OrderController@create');
Route::any('order/update', 'Strongadmin\OrderController@update');
Route::any('order/destroy', 'Strongadmin\OrderController@destroy');
Route::any('order/confirm/close', 'Strongadmin\OrderController@close'); //确认关闭
Route::any('order/confirm/paid', 'Strongadmin\OrderController@confirmPaid'); //确认已付款
Route::any('order/confirm/shipped', 'Strongadmin\OrderController@confirmShipped'); //确认发货
Route::any('order/confirm/returned', 'Strongadmin\OrderController@confirmReturned'); //确认已退货
Route::any('order/confirm/done', 'Strongadmin\OrderController@confirmDone'); //确认已完成
Route::any('order/products', 'Strongadmin\OrderController@products'); //订单产品
Route::any('order/print', 'Strongadmin\OrderController@print'); //打印
//会员管理
Route::any('user/index', 'Strongadmin\User\UserController@index');
Route::any('user/show', 'Strongadmin\User\UserController@show');
Route::any('user/create', 'Strongadmin\User\UserController@create');
Route::any('user/update', 'Strongadmin\User\UserController@update');
Route::any('user/destroy', 'Strongadmin\User\UserController@destroy');
//文章管理
Route::any('article/article/index', 'Strongadmin\Article\ArticleController@index');
Route::any('article/article/show', 'Strongadmin\Article\ArticleController@show');
Route::any('article/article/create', 'Strongadmin\Article\ArticleController@create');
Route::any('article/article/update', 'Strongadmin\Article\ArticleController@update');
Route::any('article/article/destroy', 'Strongadmin\Article\ArticleController@destroy');
//文章分类
Route::any('article/category/index', 'Strongadmin\Article\CategoryController@index');
Route::any('article/category/show', 'Strongadmin\Article\CategoryController@show');
Route::any('article/category/create', 'Strongadmin\Article\CategoryController@create');
Route::any('article/category/update', 'Strongadmin\Article\CategoryController@update');
Route::any('article/category/destroy', 'Strongadmin\Article\CategoryController@destroy');
//意见反馈
Route::any('user/feedback/index', 'Strongadmin\User\FeedbackController@index');
Route::any('user/feedback/show', 'Strongadmin\User\FeedbackController@show');
Route::any('user/feedback/update', 'Strongadmin\User\FeedbackController@update');
Route::any('user/feedback/destroy', 'Strongadmin\User\FeedbackController@destroy');
//会员等级
Route::any('user/userRank/index', 'Strongadmin\User\UserRankController@index');
Route::any('user/userRank/show', 'Strongadmin\User\UserRankController@show');
Route::any('user/userRank/create', 'Strongadmin\User\UserRankController@create');
Route::any('user/userRank/update', 'Strongadmin\User\UserRankController@update');
Route::any('user/userRank/destroy', 'Strongadmin\User\UserRankController@destroy');
//配送方式管理
Route::any('shippingOption/index', 'Strongadmin\ShippingOptionController@index');
Route::any('shippingOption/show', 'Strongadmin\ShippingOptionController@show');
Route::any('shippingOption/create', 'Strongadmin\ShippingOptionController@create');
Route::any('shippingOption/update', 'Strongadmin\ShippingOptionController@update');
//Route::any('shippingOption/destroy', 'Strongadmin\ShippingOptionController@destroy');
//配送方式管理-配送区域
Route::any('shippingOptionConfig/index', 'Strongadmin\ShippingOptionConfigController@index');
Route::any('shippingOptionConfig/show', 'Strongadmin\ShippingOptionConfigController@show');
Route::any('shippingOptionConfig/create', 'Strongadmin\ShippingOptionConfigController@create');
Route::any('shippingOptionConfig/update', 'Strongadmin\ShippingOptionConfigController@update');
Route::any('shippingOptionConfig/destroy', 'Strongadmin\ShippingOptionConfigController@destroy');
//支付方式管理
Route::any('paymentOption/index', 'Strongadmin\PaymentOptionController@index');
Route::any('paymentOption/show', 'Strongadmin\PaymentOptionController@show');
Route::any('paymentOption/create', 'Strongadmin\PaymentOptionController@create');
Route::any('paymentOption/update', 'Strongadmin\PaymentOptionController@update');
Route::any('paymentOption/destroy', 'Strongadmin\PaymentOptionController@destroy');
//地区-国家管理
Route::any('region/regionCountry/index', 'Strongadmin\Region\RegionCountryController@index');
Route::any('region/regionCountry/show', 'Strongadmin\Region\RegionCountryController@show');
Route::any('region/regionCountry/create', 'Strongadmin\Region\RegionCountryController@create');
Route::any('region/regionCountry/update', 'Strongadmin\Region\RegionCountryController@update');
Route::any('region/regionCountry/destroy', 'Strongadmin\Region\RegionCountryController@destroy');
//地区-大陆管理
Route::any('region/regionContinent/index', 'Strongadmin\Region\RegionContinentController@index');
Route::any('region/regionContinent/show', 'Strongadmin\Region\RegionContinentController@show');
Route::any('region/regionContinent/create', 'Strongadmin\Region\RegionContinentController@create');
Route::any('region/regionContinent/update', 'Strongadmin\Region\RegionContinentController@update');
Route::any('region/regionContinent/destroy', 'Strongadmin\Region\RegionContinentController@destroy');
//网站配置
Route::any('webconfig/show', 'Strongadmin\WebconfigController@showForm');//配置详情
Route::any('webconfig/save/config', 'Strongadmin\WebconfigController@saveConfig');//保存配置
Route::any('webconfig/clearcache', 'Strongadmin\WebconfigController@clearcache');//清楚缓存
Route::any('webconfig/sendReceiveMailTest', 'Strongadmin\WebconfigController@sendReceiveMailTest');//清楚缓存
//产品评论
Route::any('product/comment/index', 'Strongadmin\Product\CommentController@index');
Route::any('product/comment/show', 'Strongadmin\Product\CommentController@show');
Route::any('product/comment/create', 'Strongadmin\Product\CommentController@create');
Route::any('product/comment/update', 'Strongadmin\Product\CommentController@update');
Route::any('product/comment/destroy', 'Strongadmin\Product\CommentController@destroy');
Route::any('product/comment/approve', 'Strongadmin\Product\CommentController@approve');
Route::any('product/comment/refused ', 'Strongadmin\Product\CommentController@refused');