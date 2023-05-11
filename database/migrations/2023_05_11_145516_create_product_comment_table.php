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
        Schema::create('product_comment', function (Blueprint $table) {
            $table->comment('產品評論表');
            $table->id();
            $table->unsignedBigInteger('user_id')->default(0)->comment('會員id');
            $table->string('first_name', 255)->nullable()->comment('會員名');
            $table->string('last_name', 255)->nullable()->comment('會員姓');
            $table->string('country', 255)->nullable()->comment('會員所屬國家');
            $table->unsignedBigInteger('at_user_id')->nullable()->default(0)->comment('@會員id');
            $table->unsignedBigInteger('product_id')->nullable()->default(0)->comment('產品id');
            $table->string('product_sku', 100)->nullable()->default('')->comment('產品sku');
            $table->string('product_spu', 100)->nullable()->default('')->comment('產品spu');
            $table->string('content', 2000)->default('')->comment('評論內容');
            $table->json('pictures')->nullable()->comment('圖片');
            $table->json('videos')->nullable()->comment('視訊');
            $table->unsignedBigInteger('likes')->default(0)->comment('點贊數');
            $table->integer('star')->default(5)->comment('評論星級');
            $table->json('more')->nullable();
            $table->integer('status')->default(2)->comment('狀態：1 審覈通過，2 待審覈，3 審覈不通過');
            $table->unsignedInteger('credits')->default(0)->comment('獲得積分獎勵');
            $table->dateTime('created_at')->nullable()->comment('建立時間');
            $table->dateTime('updated_at')->nullable()->comment('更新時間');
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
        Schema::dropIfExists('product_comment');
    }
};
