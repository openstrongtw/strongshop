<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class StrongadminRoleTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('strongadmin_role')->delete();
        
        \DB::table('strongadmin_role')->insert(array (
            0 => 
            array (
                'id' => 1,
                'name' => '管理員',
                'desc' => '超級管理員，不可刪除',
                'permissions' => '{"menu_id": ["36", "37", "1", "2", "3", "4", "5", "6", "14", "15", "16", "17", "38", "18", "19", "20", "21", "22", "26", "23", "24", "25", "7", "8", "10", "11", "12", "13", "40"], "menu_route_url": ["admin/index/panel", "admin/adminMenu/index", "admin/adminMenu/index", "admin/adminMenu/create", "admin/adminMenu/update", "admin/adminMenu/destroy", "admin/adminUser/index", "admin/adminUser/index", "admin/adminUser/update", "admin/adminUser/destroy", "admin/adminUser/create", "admin/adminRole/index", "admin/adminRole/index", "admin/adminRole/create", "admin/adminRole/update", "admin/adminRole/destroy", "admin/adminRole/assignPermissions", "admin/adminLog/index", "admin/adminLog/destroy", "admin/adminLog/index", "admin/goods/index", "admin/product/index", "admin/goods/create", "admin/goods/update", "admin/goods/destroy", "admin/product/test"]}',
                'created_at' => '2021-01-06 08:18:36',
                'updated_at' => '2021-08-19 18:19:37',
            ),
            1 => 
            array (
                'id' => 2,
                'name' => 'demo',
                'desc' => '僅作為演示',
                'permissions' => '{"menu_id": ["36", "37", "1", "2", "3", "14", "15", "18", "19", "23", "24", "25", "41", "7", "8", "10", "11", "12", "13", "42", "43", "44", "45", "46", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "72", "73", "74", "75", "76", "91", "92", "93", "94", "95", "87", "88", "89", "90", "62", "63", "64", "65", "66", "68", "69", "121", "122", "123", "124", "125", "126", "127", "47", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "103", "120", "129", "104", "130", "131", "132", "133", "134", "135", "105", "106", "109", "110", "111", "114"], "menu_route_url": ["strongadmin/index/panel", "strongadmin/adminMenu/index", "strongadmin/adminMenu/index", "strongadmin/adminUser/index", "strongadmin/adminUser/index", "strongadmin/adminRole/index", "strongadmin/adminRole/index", "strongadmin/adminLog/index", "strongadmin/adminLog/destroy", "strongadmin/adminLog/index", "strongadmin/telescope/{view?}", "strongadmin/product/index", "strongadmin/product/index", "strongadmin/product/create", "strongadmin/product/update", "strongadmin/product/destroy", "strongadmin/product/category/index", "strongadmin/product/category/index", "strongadmin/product/category/create", "strongadmin/product/category/update", "strongadmin/product/category/destroy", "strongadmin/product/spec/index", "strongadmin/product/specGroup/index", "strongadmin/product/specGroup/create", "strongadmin/product/specGroup/update", "strongadmin/product/specGroup/destroy", "strongadmin/product/spec/index", "strongadmin/product/spec/create", "strongadmin/product/spec/update", "strongadmin/product/spec/destroy", "strongadmin/product/brand/index", "strongadmin/product/brand/index", "strongadmin/product/brand/create", "strongadmin/product/brand/update", "strongadmin/product/brand/destroy", "strongadmin/user/index", "strongadmin/user/index", "strongadmin/user/update", "strongadmin/user/destroy", "strongadmin/user/userRank/index", "strongadmin/user/userRank/index", "strongadmin/user/userRank/update", "strongadmin/user/userRank/desctroy", "strongadmin/user/userRank/create", "strongadmin/user/feedback/index", "strongadmin/user/feedback/index", "strongadmin/user/feedback/update", "strongadmin/user/feedback/destroy", "strongadmin/order/index", "strongadmin/order/update", "strongadmin/order/destroy", "strongadmin/order/cancel", "strongadmin/order/products", "strongadmin/order/index", "strongadmin/order/confirm/close", "strongadmin/order/confirm/paid", "strongadmin/order/confirm/shipped", "strongadmin/order/confirm/returned", "strongadmin/order/confirm/done", "strongadmin/order/print", "strongadmin/order/show", "strongadmin/article/category/index", "strongadmin/article/category/index", "strongadmin/article/category/create", "strongadmin/article/category/update", "strongadmin/article/category/destroy", "strongadmin/article/article/index", "strongadmin/article/article/index", "strongadmin/article/article/create", "strongadmin/article/article/update", "strongadmin/article/article/destroy", "strongadmin/webconfig/show", "strongadmin/webconfig/show", "strongadmin/shippingOption/index", "strongadmin/shippingOption/index", "strongadmin/shippingOption/update", "strongadmin/shippingOptionConfig/index", "strongadmin/shippingOptionConfig/create", "strongadmin/shippingOptionConfig/update", "strongadmin/shippingOptionConfig/destroy", "strongadmin/paymentOption/index", "strongadmin/paymentOption/index", "strongadmin/region/regionCountry/index", "strongadmin/region/regionCountry/index", "strongadmin/region/regionCountry/show", "strongadmin/region/regionContinent/index"]}',
                'created_at' => '2021-01-06 08:19:12',
                'updated_at' => '2021-09-22 15:22:33',
            ),
        ));
        
        
    }
}