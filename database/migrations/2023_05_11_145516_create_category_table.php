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
        Schema::create('category', function (Blueprint $table) {
            $table->comment('分類表');
            $table->id()->comment('分類id');
            $table->unsignedInteger('type')->default(1)->comment('型別：1 產品分類，2 文章分類');
            $table->unsignedInteger('level')->default(1)->comment('等級 1 一級, 2 二級, 3 三級');
            $table->unsignedInteger('parent_id')->default(0)->comment('上級id')->index();
            $table->string('name', 100)->default('')->comment('分類名稱');
            $table->unsignedInteger('status')->default(1)->comment('狀態 1開啟,2禁用');
            $table->integer('sort')->nullable()->default(200)->comment('排序');
            $table->dateTime('created_at')->nullable()->comment('建立時間');
            $table->dateTime('updated_at')->nullable()->comment('更新時間');
            $table->dateTime('deleted_at')->nullable()->comment('刪除時間');
            $table->string('meta_keywords', 255)->nullable()->comment('meta 關鍵字');
            $table->string('meta_description', 255)->nullable()->comment('meta 描述');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('category');
    }
};
