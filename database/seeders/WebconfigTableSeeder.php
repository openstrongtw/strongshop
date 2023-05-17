<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class WebconfigTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('webconfig')->delete();
        
        \DB::table('webconfig')->insert(array (
            0 => 
            array (
                'id' => 1,
                'key' => 'notice',
                'value' => '免費開源的跨境電商網站。<a href="/admin/home" class="btn btn-primary btn-sm">進入後臺管理</a>',
                'created_at' => '2021-08-07 11:31:30',
                'updated_at' => '2021-08-19 18:10:27',
            ),
            1 => 
            array (
                'id' => 2,
                'key' => 'store_title',
                'value' => 'StrongShop 商城 - 免費開源的跨境電商網站',
                'created_at' => '2021-08-07 11:32:23',
                'updated_at' => '2021-08-19 18:10:27',
            ),
            2 => 
            array (
                'id' => 3,
                'key' => 'meta_keywords',
                'value' => '跨境電商，電商網站，Laravel商城，PHP商城，StrongShop',
                'created_at' => '2021-08-07 11:33:26',
                'updated_at' => '2021-08-19 18:10:27',
            ),
            3 => 
            array (
                'id' => 4,
                'key' => 'meta_description',
                'value' => 'StrongShop 是一款免費開源的跨境電商商城網站。基於 PHP Laravel6 框架開發，遵循BSD-4-Clause開源協議,免費商用，支援多語言，多貨幣，多種國際配送方式，PayPal 支付，國際信用卡支付，PC Web 端和移動端自適應。',
                'created_at' => '2021-08-07 11:35:12',
                'updated_at' => '2021-08-19 18:10:27',
            ),
            4 => 
            array (
                'id' => 14,
                'key' => 'MAIL_HOST',
                'value' => 'smtp.qq.com',
                'created_at' => '2021-08-13 10:35:26',
                'updated_at' => '2021-08-19 18:10:27',
            ),
            5 => 
            array (
                'id' => 15,
                'key' => 'MAIL_PORT',
                'value' => '465',
                'created_at' => '2021-08-13 10:35:26',
                'updated_at' => '2021-08-19 18:10:27',
            ),
            6 => 
            array (
                'id' => 24,
                'key' => 'MAIL_REPLYTO_NAME',
                'value' => 'StrongShop',
                'created_at' => '2021-08-13 11:26:01',
                'updated_at' => '2021-08-19 18:10:28',
            ),
            7 => 
            array (
                'id' => 26,
                'key' => 'notice_email_signed',
                'value' => NULL,
                'created_at' => '2021-08-13 13:09:04',
                'updated_at' => '2021-08-19 18:10:27',
            ),
            8 => 
            array (
                'id' => 27,
                'key' => 'notice_email_created_order',
                'value' => NULL,
                'created_at' => '2021-08-13 13:09:04',
                'updated_at' => '2021-08-19 18:10:27',
            ),
            9 => 
            array (
                'id' => 28,
                'key' => 'notice_email_paid_order',
                'value' => NULL,
                'created_at' => '2021-08-13 13:09:04',
                'updated_at' => '2021-08-19 18:10:27',
            ),
            10 => 
            array (
                'id' => 29,
                'key' => 'notice_email_shipped_order',
                'value' => NULL,
                'created_at' => '2021-08-13 13:09:04',
                'updated_at' => '2021-08-19 18:10:27',
            ),
            11 => 
            array (
                'id' => 30,
                'key' => 'notice_email_closed_order',
                'value' => NULL,
                'created_at' => '2021-08-13 13:09:05',
                'updated_at' => '2021-08-19 18:10:27',
            ),
        ));
        
        
    }
}