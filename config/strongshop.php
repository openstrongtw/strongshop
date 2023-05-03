<?php

return [
    'storeName' => config('app.name'), //商店简称
    'defaultLanguage' => config('app.locale'), //默认语言
    'defaultCountry' => 'US', //默认国家 `US`美国简码
    /**
     * 货币&价格
     */
    'defaultCurrency' => 'USD', //前台默认显示货币
    'defaultCurrencyBackend' => 'USD', //后台管理默认使用货币（修改此参数请记得调整下面的`汇率/转换率`）
    'defaultCurrencyPay' => 'USD', //订单结算货币：null 代表按照前台选择的货币进行结算，否则将强制转换成此货币结算。
    'defaultDedimal' => 3, //价格小数位数
    'showShipingFeeInCart' => true, //在购物车中显示运费
    'showShipinglistInCart' => true, //在购物车中支持选择配送方式
    'showCountriesInCart' => true, //在购物车中支持选择国家
    'showToggleProductAjax' => true, //产品详情页选择规格切换产品时采用 ajax 异步加载产品详情，如果是 false 则会以跳转地址栏方式渲染产品
    'multiLanguageBackend' => 1, //后台数据录入使用多语言录入形式
    /**
     * 产品图片配置
     */
    'productImage' => [
        'uploadLimitMimes' => 'jpg,jpeg,png', //限制上传图片类型:jpg,jpeg,gif,png
        'uploadLimitSize' => 200, //限制上传大小 单位：kb
        'uploadLimitWidth' => null, //限制上传宽度：像素 px ，设置为 null 则为不限制
        'uploadLimitHeight' => null, //限制上传高度：像素 px ，设置为 null 则为不限制
        //缩略图生成配置
        'thumb' => [
            'suffix_name' => '_thumb', //缩略图后缀名称
            'width' => 300, //生成宽度
            'height' => null, //生成高度，设置为null，则为自适应高度
        ],
    ],
    /**
     * 语言
     */
    'langs' => [
        'en' => [
            'code' => 'en', //语言简码
            'name' => 'English', //语言名称
            'currency' => 'USD', //货币符号
        ],
        'zh-CN' => [
            'code' => 'zh-CN',
            'name' => '简体中文',
            'currency' => 'CNY',
        ],
        'ja' => [
            'code' => 'ja',
            'name' => '日本',
            'currency' => 'JPY',
        ],
    ],
    /**
     * 货币和汇率(转换率)
     */
    'currencies' => [
        //人民币
        'CNY' => [
            'name' => '¥CNY',
            'code' => 'CNY',
            'rate' => 6.3945,
        ],
        //美元
        'USD' => [
            'name' => '$USD',
            'code' => 'USD',
            'rate' => 1, //汇率
        ],
        //欧元
        'EUR' => [
            'name' => '€EUR',
            'code' => 'EUR',
            'rate' => 0.83,
        ],
        //英镑
        'GBP' => [
            'name' => '£GBP',
            'code' => 'GBP',
            'rate' => 0.70,
        ],
        //澳元
        'AUD' => [
            'name' => '$AUD',
            'code' => 'AUD',
            'rate' => 1.34,
        ],
        //加元
        'CAD' => [
            'name' => '$CAD',
            'code' => 'CAD',
            'rate' => 1.23,
        ],
        //日元
        'JPY' => [
            'name' => '￥JPY',
            'code' => 'JPY',
            'rate' => 125.572,
        ],
    ],
    /**
     * 支付配置
     */
    'payment' => [
        //paypal
        'paypal' => [
            'business' => env('PAYMENT_PAYPAL_BUSINESS'), //收款账号
            'env' => env('PAYMENT_PAYPAL_ENV', 'sandbox'), //环境
            'notify_url' => env('PAYMENT_PAYPAL_NOTIFY_URL'),
        ],
    ],
    /**
     * 订阅者注册监听器
     */
    'listen' => [
    //'Illuminate\Auth\Events\Login' => 'App\Listeners\UpdateShoppingCart@handle',
    ],
    /**
     * token（使用api接口有效）
     */
    'apiToken' => [
        /*
          |--------------------------------------------------------------------------
          | token 有效时长，默认为30天。
          |--------------------------------------------------------------------------
          |您还可以将此设置为null，以生成永不过期的令牌。有些人可能想在移动应用程序中使用这种行为。这不是特别推荐的
         */
        'ttl' => 30 * 24 * 3600, //单位：秒
        /*
          |--------------------------------------------------------------------------
          |刷新时间
          |--------------------------------------------------------------------------
          |指定刷新令牌的时间长度。 例如，用户可以在2天的窗口内刷新token，初始令牌被创建，直到它们必须重新进行身份验证。默认为2天。
          |您也可以将此设置为null，以表示无需刷新token。
          |
         */
        'refresh_ttl' => 2 * 24 * 3600, //单位：秒
    ],
];
