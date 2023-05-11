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
        Schema::create('user_collect', function (Blueprint $table) {
            $table->comment('會員產品收藏表');
            $table->id();
            $table->unsignedBigInteger('user_id')->default(0)->comment('會員id');
            $table->unsignedBigInteger('product_id')->default(0)->comment('產品id');
            $table->dateTime('created_at')->nullable()->comment('建立時間');
            $table->dateTime('updated_at')->nullable()->comment('更新時間');

            $table->unique(['user_id', 'product_id'], 'uniq_user_id_product_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_collect');
    }
};
