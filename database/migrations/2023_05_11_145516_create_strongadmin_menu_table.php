<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('strongadmin_menu', function (Blueprint $table) {
            $table->comment('菜單表');
            $table->integer('id', true)->comment('菜單id');
            $table->unsignedInteger('level')->nullable()->default(1)->comment('等級 1 一級菜單, 2 二級菜單, 3 三級菜單');
            $table->unsignedInteger('parent_id')->nullable()->default(0)->comment('上級菜單');
            $table->string('name', 100)->nullable()->default('')->comment('菜單名稱');
            $table->string('route_url', 200)->nullable()->comment('菜單跳轉地址');
            $table->unsignedInteger('status')->nullable()->default(1)->comment('狀態 1開啟,2禁用');
            $table->integer('sort')->nullable()->default(100)->comment('排序');
            $table->dateTime('created_at')->nullable()->comment('新增時間');
            $table->dateTime('updated_at')->nullable();
            $table->integer('delete_allow')->default(1)->comment('是否允許刪除：1 允許，2 不允許');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('strongadmin_menu');
    }
};
