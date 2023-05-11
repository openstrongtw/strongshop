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
        Schema::create('shipping_option', function (Blueprint $table) {
            $table->comment('配送方式');
            $table->id();
            $table->string('title', 255)->default('')->comment('配送名稱');
            $table->string('desc', 255)->nullable()->default('')->comment('描述');
            $table->string('code', 100)->default('');
            $table->integer('status')->default(1)->comment('狀態：1 啟動，2 禁用');
            $table->json('more')->nullable();
            $table->dateTime('created_at')->nullable();
            $table->dateTime('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shipping_option');
    }
};
