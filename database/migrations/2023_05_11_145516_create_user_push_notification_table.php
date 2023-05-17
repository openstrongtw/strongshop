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
        Schema::create('user_push_notification', function (Blueprint $table) {
            $table->comment('會員發送通知（郵件）記錄表');
            $table->id();
            $table->integer('type')->default(1)->comment('通知型別：1 郵件，2 簡訊');
            $table->string('title', 255)->default('')->comment('標題');
            $table->longText('content')->comment('內容');
            $table->unsignedBigInteger('admin_id')->default(0);
            $table->dateTime('send_at')->nullable()->comment('推送時間');
            $table->integer('status')->default(1)->comment('狀態：1 正常，2 取消');
            $table->dateTime('created_at')->nullable()->comment('建立時間');
            $table->dateTime('updated_at')->nullable()->comment('更新時間');
            $table->dateTime('deleted_at')->nullable()->comment('刪除時間');
            $table->string('remark', 255)->default('')->comment('備註');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_push_notification');
    }
};
