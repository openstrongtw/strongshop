<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ArticleTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {


        \DB::table('article')->delete();

        \DB::table('article')->insert(array (
            0 =>
            array (
                'id' => 1,
                'category_id' => 30,
                'title' => '{"en":"Privacy & Security","zh-CN":"\\u9690\\u79c1&\\u5b89\\u5168"}',
                'postid' => 'privacy',
                'cover_img' => '',
                'content' => '{"en":"<p><a href=\\"https:\\/\\/demo.strongshop.cn\\/article\\/privacy\\">Privacy &amp; Security<\\/a><br\\/><\\/p><p><a href=\\"https:\\/\\/demo.strongshop.cn\\/article\\/privacy\\">Privacy &amp; Security<\\/a><br\\/><\\/p><p><a href=\\"https:\\/\\/demo.strongshop.cn\\/article\\/privacy\\">Privacy &amp; Security<\\/a><br\\/><\\/p><p><a href=\\"https:\\/\\/demo.strongshop.cn\\/article\\/privacy\\">Privacy &amp; Security<\\/a><br\\/><\\/p>","zh-CN":null}',
                'author' => 'StrongShop',
                'status' => 1,
                'sort' => 200,
                'created_at' => '2022-02-10 16:57:38',
                'updated_at' => '2022-02-10 16:59:36',
                'deleted_at' => NULL,
                'meta_keywords' => '',
                'meta_description' => '',
                'origin' => NULL,
            ),
            1 =>
            array (
                'id' => 2,
                'category_id' => 30,
                'title' => '{"en":"About Us","zh-CN":"\\u5173\\u4e8e\\u6211\\u4eec"}',
                'postid' => 'aboutus',
                'cover_img' => '',
                'content' => '{"en":"<p>About us<\\/p>","zh-CN":null}',
                'author' => 'StrongShop',
                'status' => 1,
                'sort' => 200,
                'created_at' => '2022-02-10 16:58:13',
                'updated_at' => '2022-02-10 16:58:13',
                'deleted_at' => NULL,
                'meta_keywords' => '',
                'meta_description' => '',
                'origin' => NULL,
            ),
            2 =>
            array (
                'id' => 3,
                'category_id' => 30,
                'title' => '{"en":"Delivery","zh-CN":"\\u53d1\\u8d27"}',
                'postid' => 'delivery',
                'cover_img' => '',
                'content' => '{"en":"<p>delivery<\\/p>","zh-CN":"<p>\\u53d1\\u8d27\\u53d1\\u8d27\\u53d1\\u8d27\\u53d1\\u8d27<br\\/><\\/p>"}',
                'author' => 'StrongShop',
                'status' => 1,
                'sort' => 200,
                'created_at' => '2022-02-10 16:58:41',
                'updated_at' => '2022-02-10 16:59:08',
                'deleted_at' => NULL,
                'meta_keywords' => '',
                'meta_description' => '',
                'origin' => NULL,
            ),
        ));


    }
}
