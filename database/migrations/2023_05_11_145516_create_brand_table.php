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
        Schema::create('brand', function (Blueprint $table) {
            $table->comment('品牌表');
            $table->id();
            $table->string('title', 100)->default('')->unique('title')->comment('品牌名稱');
            $table->string('logo', 255)->default('')->comment('品牌logo');
            $table->json('more')->nullable()->comment('更多其他配置');
            $table->unsignedInteger('status')->default(1)->comment('狀態 1開啟,2禁用');
            $table->integer('sort')->nullable()->default(100)->comment('排序');
            $table->dateTime('created_at')->nullable()->comment('建立時間');
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
        Schema::dropIfExists('brand');
    }
};
