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
        Schema::create('user_feedback', function (Blueprint $table) {
            $table->comment('意見反饋表');
            $table->id()->comment('反饋id');
            $table->unsignedBigInteger('parent_id')->default(0);
            $table->unsignedTinyInteger('type')->default(0)->comment('反饋型別：1 購買，2 功能， 3 其他');
            $table->unsignedBigInteger('user_id')->default(0)->comment('反饋使用者id');
            $table->string('title', 100)->default('')->comment('標題');
            $table->text('content')->nullable()->comment('內容');
            $table->text('content_reply')->nullable()->comment('回覆內容 (管理員回覆)');
            $table->unsignedBigInteger('admin_id')->default(0)->comment('回覆管理員id');
            $table->json('more')->nullable()->comment('更多內容');
            $table->unsignedTinyInteger('status')->default(0)->comment('狀態：1 未回覆，2 已回覆');
            $table->dateTime('created_at')->nullable();
            $table->dateTime('updated_at')->nullable();
            $table->dateTime('deleted_at')->nullable()->comment('刪除時間');
            $table->dateTime('read_at')->nullable()->comment('已讀時間');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_feedback');
    }
};
