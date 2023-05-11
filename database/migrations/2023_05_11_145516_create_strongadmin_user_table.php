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
        Schema::create('strongadmin_user', function (Blueprint $table) {
            $table->comment('管理員表');
            $table->id()->comment('管理員id');
            $table->string('user_name', 50)->default('')->unique('uniq_user_name')->comment('登錄名');
            $table->string('password', 100)->nullable()->comment('登錄密碼');
            $table->rememberToken()->comment('記住登錄');
            $table->string('name', 100)->nullable()->default('')->comment('姓名');
            $table->string('email', 255)->nullable()->default('')->comment('郵箱');
            $table->string('phone', 255)->nullable()->default('')->comment('手機號');
            $table->string('avatar', 255)->nullable()->default('')->comment('頭像');
            $table->string('introduction', 255)->nullable()->default('')->comment('介紹');
            $table->unsignedInteger('status')->default(1)->comment('狀態 1 啟用, 2 禁用');
            $table->string('last_ip', 255)->nullable()->default('')->comment('最近一次登錄ip');
            $table->dateTime('last_at')->nullable()->comment('最近一次登錄時間');
            $table->dateTime('created_at')->nullable()->comment('新增時間');
            $table->dateTime('updated_at')->nullable()->comment('更新時間');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('strongadmin_user');
    }
};
