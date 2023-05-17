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
        Schema::create('spec', function (Blueprint $table) {
            $table->comment('產品規格表');
            $table->id()->comment('規格id');
            $table->unsignedBigInteger('spec_group_id')->default(0)->comment('規格組id')->index();
            $table->string('name', 255)->default('')->comment('規格名稱');
            $table->integer('spec_type')->default(1)->comment('規格型別：1 價格規格，2 普通規格');
            $table->integer('input_type')->default(1)->comment('錄入方式：1 下拉選擇，2 文字輸入');
            $table->text('select_values')->nullable()->comment('可選值列表：錄入方式為 1 時使用');
            $table->dateTime('created_at')->nullable()->comment('建立時間');
            $table->dateTime('updated_at')->nullable()->comment('更新時間');
            $table->integer('is_show_img')->nullable()->default(2)->comment('是否顯示圖片 1 顯示，2 不顯示');
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
        Schema::dropIfExists('spec');
    }
};
