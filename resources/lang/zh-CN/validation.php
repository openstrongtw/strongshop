<?php

return [
    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines contain the default error messages used by
    | the validator class. Some of these rules have multiple versions such
    | as the size rules. Feel free to tweak each of these messages here.
    |
    */

    'accepted'        => '您必須接受 :attribute。',
    'active_url'      => ':attribute 不是一個有效的網址。',
    'after'           => ':attribute 必須要晚於 :date。',
    'after_or_equal'  => ':attribute 必須要等於 :date 或更晚。',
    'alpha'           => ':attribute 只能由字母組成。',
    'alpha_dash'      => ':attribute 只能由字母、數字、短劃線(-)和下劃線(_)組成。',
    'alpha_num'       => ':attribute 只能由字母和數字組成。',
    'array'           => ':attribute 必須是一個陣列。',
    'before'          => ':attribute 必須要早於 :date。',
    'before_or_equal' => ':attribute 必須要等於 :date 或更早。',
    'between'         => [
        'numeric' => ':attribute 必須介於 :min - :max 之間。',
        'file'    => ':attribute 必須介於 :min - :max KB 之間。',
        'string'  => ':attribute 必須介於 :min - :max 個字元之間。',
        'array'   => ':attribute 必須只有 :min - :max 個單元。',
    ],
    'boolean'        => ':attribute 必須為布爾值。',
    'confirmed'      => ':attribute 兩次輸入不一致。',
    'date'           => ':attribute 不是一個有效的日期。',
    'date_equals'    => ':attribute 必須要等於 :date。',
    'date_format'    => ':attribute 的格式必須為 :format。',
    'different'      => ':attribute 和 :other 必須不同。',
    'digits'         => ':attribute 必須是 :digits 位的數字。',
    'digits_between' => ':attribute 必須是介於 :min 和 :max 位的數字。',
    'dimensions'     => ':attribute 圖片尺寸不正確。',
    'distinct'       => ':attribute 已經存在。',
    'email'          => ':attribute 不是一個合法的郵箱。',
    'ends_with'      => ':attribute 必須以 :values 為結尾。',
    'exists'         => ':attribute 不存在。',
    'file'           => ':attribute 必須是檔案。',
    'filled'         => ':attribute 不能為空。',
    'gt'             => [
        'numeric' => ':attribute 必須大於 :value。',
        'file'    => ':attribute 必須大於 :value KB。',
        'string'  => ':attribute 必須多於 :value 個字元。',
        'array'   => ':attribute 必須多於 :value 個元素。',
    ],
    'gte' => [
        'numeric' => ':attribute 必須大於或等於 :value。',
        'file'    => ':attribute 必須大於或等於 :value KB。',
        'string'  => ':attribute 必須多於或等於 :value 個字元。',
        'array'   => ':attribute 必須多於或等於 :value 個元素。',
    ],
    'image'    => ':attribute 必須是圖片。',
    'in'       => '已選的屬性 :attribute 非法。',
    'in_array' => ':attribute 沒有在 :other 中。',
    'integer'  => ':attribute 必須是整數。',
    'ip'       => ':attribute 必須是有效的 IP 地址。',
    'ipv4'     => ':attribute 必須是有效的 IPv4 地址。',
    'ipv6'     => ':attribute 必須是有效的 IPv6 地址。',
    'json'     => ':attribute 必須是正確的 JSON 格式。',
    'lt'       => [
        'numeric' => ':attribute 必須小於 :value。',
        'file'    => ':attribute 必須小於 :value KB。',
        'string'  => ':attribute 必須少於 :value 個字元。',
        'array'   => ':attribute 必須少於 :value 個元素。',
    ],
    'lte' => [
        'numeric' => ':attribute 必須小於或等於 :value。',
        'file'    => ':attribute 必須小於或等於 :value KB。',
        'string'  => ':attribute 必須少於或等於 :value 個字元。',
        'array'   => ':attribute 必須少於或等於 :value 個元素。',
    ],
    'max' => [
        'numeric' => ':attribute 不能大於 :max。',
        'file'    => ':attribute 不能大於 :max KB。',
        'string'  => ':attribute 不能大於 :max 個字元。',
        'array'   => ':attribute 最多隻有 :max 個單元。',
    ],
    'mimes'     => ':attribute 必須是一個 :values 型別的檔案。',
    'mimetypes' => ':attribute 必須是一個 :values 型別的檔案。',
    'min'       => [
        'numeric' => ':attribute 必須大於等於 :min。',
        'file'    => ':attribute 大小不能小於 :min KB。',
        'string'  => ':attribute 至少為 :min 個字元。',
        'array'   => ':attribute 至少有 :min 個單元。',
    ],
    'not_in'               => '已選的屬性 :attribute 非法。',
    'not_regex'            => ':attribute 的格式錯誤。',
    'numeric'              => ':attribute 必須是一個數字。',
    'password'             => '密碼錯誤',
    'present'              => ':attribute 必須存在。',
    'regex'                => ':attribute 格式不正確。',
    'required'             => ':attribute 不能為空。',
    'required_if'          => '當 :other 為 :value 時 :attribute 不能為空。',
    'required_unless'      => '當 :other 不為 :values 時 :attribute 不能為空。',
    'required_with'        => '當 :values 存在時 :attribute 不能為空。',
    'required_with_all'    => '當 :values 存在時 :attribute 不能為空。',
    'required_without'     => '當 :values 不存在時 :attribute 不能為空。',
    'required_without_all' => '當 :values 都不存在時 :attribute 不能為空。',
    'same'                 => ':attribute 和 :other 必須相同。',
    'size'                 => [
        'numeric' => ':attribute 大小必須為 :size。',
        'file'    => ':attribute 大小必須為 :size KB。',
        'string'  => ':attribute 必須是 :size 個字元。',
        'array'   => ':attribute 必須為 :size 個單元。',
    ],
    'starts_with' => ':attribute 必須以 :values 為開頭。',
    'string'      => ':attribute 必須是一個字串。',
    'timezone'    => ':attribute 必須是一個合法的時區值。',
    'unique'      => ':attribute 已經存在。',
    'uploaded'    => ':attribute 上傳失敗。',
    'url'         => ':attribute 格式不正確。',
    'uuid'        => ':attribute 必須是有效的 UUID。',

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap our attribute placeholder
    | with something more reader friendly such as "E-Mail Address" instead
    | of "email". This simply helps us make our message more expressive.
    |
    */

    'attributes' => [
        'name'                  => '名稱',
        'username'              => '使用者名稱',
        'email'                 => '郵箱',
        'first_name'            => '名',
        'last_name'             => '姓',
        'password'              => '密碼',
        'password_confirmation' => '確認密碼',
        'city'                  => '城市',
        'country'               => '國家',
        'address'               => '地址',
        'phone'                 => '電話',
        'mobile'                => '手機',
        'age'                   => '年齡',
        'sex'                   => '性別',
        'gender'                => '性別',
        'day'                   => '天',
        'month'                 => '月',
        'year'                  => '年',
        'hour'                  => '時',
        'minute'                => '分',
        'second'                => '秒',
        'title'                 => '標題',
        'content'               => '內容',
        'description'           => '描述',
        'excerpt'               => '摘要',
        'date'                  => '日期',
        'time'                  => '時間',
        'available'             => '可用的',
        'size'                  => '大小',
    ],
];
