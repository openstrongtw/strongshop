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
        Schema::create('article', function (Blueprint $table) {
            $table->comment('文章表');
            $table->id();
            $table->integer('category_id')->default(0)->comment('文章分類id');
            $table->string('title', 100)->default('')->comment('標題');
            $table->string('postid', 100)->nullable()->unique('postid')->comment('唯一發布標識');
            $table->string('cover_img', 255)->default('')->comment('封面圖');
            $table->longText('content')->comment('內容');
            $table->string('author', 255)->nullable()->default('')->comment('作者');
            $table->unsignedInteger('status')->default(1)->comment('狀態 1開啟,2禁用');
            $table->integer('sort')->nullable()->default(100)->comment('排序');
            $table->dateTime('created_at')->nullable()->comment('建立時間');
            $table->dateTime('updated_at')->nullable()->comment('更新時間');
            $table->dateTime('deleted_at')->nullable()->comment('刪除時間');
            $table->string('meta_keywords', 255)->nullable()->default('')->comment('meta 關鍵字');
            $table->string('meta_description', 255)->nullable()->default('')->comment('meta 描述');
            $table->string('origin', 255)->nullable()->comment('內容來源');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('article');
    }
};
