<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableUserAddApiTokenAtApiTokenRefershAt extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("ALTER TABLE `st_user` 
ADD COLUMN `api_token_at` datetime(0) NULL COMMENT 'api token 有效期至' AFTER `api_token`,
ADD COLUMN `api_token_refresh_at` datetime(0) NULL COMMENT 'api token 刷新时间' AFTER `api_token_at`;");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }

}
