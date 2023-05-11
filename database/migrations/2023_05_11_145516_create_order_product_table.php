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
        Schema::create('order_product', function (Blueprint $table) {
            $table->comment('訂單產品');
            $table->id();
            $table->unsignedBigInteger('order_id')->default(0)->comment('訂單id');
            $table->unsignedBigInteger('product_id')->comment('產品id');
            $table->string('title', 255)->default('')->comment('產品標題');
            $table->string('sku', 100)->default('')->comment('SKU');
            $table->unsignedInteger('weight')->default(0)->comment('重量：g');
            $table->string('currency_code', 50)->default('')->comment('結算貨幣');
            $table->unsignedDecimal('currency_rate', 10, 6)->default(1)->comment('結算貨幣轉換率');
            $table->unsignedDecimal('original_price', 10, 3)->default(0)->comment('原價：元');
            $table->unsignedDecimal('sale_price', 10, 3)->default(0)->comment('售價：元');
            $table->string('img_cover', 255)->nullable()->default('')->comment('產品封面圖');
            $table->json('specs')->nullable()->comment('已選規格');
            $table->unsignedInteger('qty')->default(0)->comment('已購數量');
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
        Schema::dropIfExists('order_product');
    }
};
