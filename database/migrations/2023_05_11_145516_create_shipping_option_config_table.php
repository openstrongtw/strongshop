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
        Schema::create('shipping_option_config', function (Blueprint $table) {
            $table->comment('配送費用公式');
            $table->id();
            $table->string('title', 255)->comment('標題');
            $table->unsignedBigInteger('shipping_option_id')->default(0)->comment('配送方式id');
            $table->json('countries')->comment('國家');
            $table->json('states')->nullable()->comment('省');
            $table->json('more')->comment('配置');
            $table->integer('status')->default(1)->comment('狀態：1 啟動，2 禁用');
            $table->dateTime('created_at')->nullable();
            $table->dateTime('updated_at')->nullable();
            $table->dateTime('deleted_at')->nullable()->comment('刪除時間');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shipping_option_config');
    }
};
