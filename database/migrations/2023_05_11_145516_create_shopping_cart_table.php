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
        Schema::create('shopping_cart', function (Blueprint $table) {
            $table->comment('購物車');
            $table->id();
            $table->unsignedInteger('user_id')->default(0)->comment('使用者id');
            $table->string('uuid', 100)->default('');
            $table->unsignedInteger('product_id')->default(0);
            $table->unsignedDecimal('product_price', 10)->default(0)->comment('加入購物車時的價格，不作為結算單價');
            $table->unsignedInteger('qty')->default(1)->comment('數量');
            $table->unsignedInteger('is_buy_now')->default(0)->comment('是否是立即購買');
            $table->dateTime('created_at')->nullable();
            $table->dateTime('updated_at')->nullable();
            $table->unique(['uuid', 'product_id', 'is_buy_now'], 'uniq_uuid_product_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shopping_cart');
    }
};
