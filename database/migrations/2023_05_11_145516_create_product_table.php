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
        Schema::create('product', function (Blueprint $table) {
            $table->comment('產品表');
            $table->id()->comment('產品id');
            $table->string('title', 255)->default('')->fulltext('title')->comment('產品標題');
            $table->string('intro', 255)->nullable()->default('')->comment('產品簡介');
            $table->text('details')->nullable()->comment('產品詳情');
            $table->string('meta_keywords', 255)->nullable()->default('')->comment('meta 關鍵字');
            $table->string('meta_description', 255)->nullable()->default('')->comment('meta 描述');
            $table->string('spu', 100)->default('')->comment('SPU');
            $table->string('sku', 100)->default('')->unique('sku')->comment('SKU');
            $table->unsignedInteger('stock')->default(0)->comment('庫存');
            $table->integer('stock_status')->default(1)->comment('庫存狀態 1 有庫存，2 無庫存');
            $table->unsignedDecimal('original_price', 10, 3)->default(0)->comment('原價：元');
            $table->unsignedDecimal('sale_price', 10, 3)->default(0)->comment('售價：元');
            $table->json('wholesale_set')->nullable()->comment('批發設定');
            $table->string('img_cover', 255)->nullable()->default('')->comment('產品封面圖');
            $table->string('img_spec', 255)->nullable()->default('')->comment('產品規格圖');
            $table->json('img_photos')->nullable()->comment('產品相簿');
            $table->unsignedInteger('long')->nullable()->default(0)->comment('產品長度');
            $table->unsignedInteger('width')->nullable()->default(0)->comment('產品寬度');
            $table->unsignedInteger('high')->nullable()->default(0)->comment('產品高度');
            $table->unsignedInteger('weight')->nullable()->default(0)->comment('重量：克');
            $table->unsignedInteger('volume_weight')->nullable()->default(0)->comment('體積重：克');
            $table->unsignedInteger('click_num')->nullable()->default(0)->comment('點選數 檢視數');
            $table->unsignedInteger('sale_num')->nullable()->default(0)->comment('銷售數量');
            $table->integer('status')->default(1)->comment('狀態：1 上架(顯示)，2 下架(不顯示)');
            $table->integer('hidden')->default(2)->comment('是否強制隱藏：1 是，2 否 (如果是則在產品列表中不顯示)');
            $table->string('remark', 255)->nullable()->default('')->comment('產品備註：僅後臺看到');
            $table->dateTime('created_at')->nullable()->comment('建立時間');
            $table->dateTime('updated_at')->nullable()->comment('更新時間');
            $table->dateTime('deleted_at')->nullable()->comment('刪除時間');
            $table->string('related_sku', 255)->nullable()->default('')->comment('相關產品');
            $table->string('related_accessories_sku', 999)->nullable()->comment('相關配件');
            $table->unsignedInteger('brand_id')->nullable()->default(0)->comment('所屬品牌id');
            $table->unsignedInteger('spec_group_id')->nullable()->comment('規格組id');
            $table->integer('is_hot')->nullable()->default(2)->comment('熱賣 1 是，2 否');
            $table->integer('is_new')->nullable()->default(2)->comment('新品 1 是，2 否');
            $table->integer('is_recommend')->nullable()->default(2)->comment('推薦 1 是，2 否');
            $table->json('more')->nullable()->comment('更多配置');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product');
    }
};
