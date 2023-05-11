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
        Schema::create('strongadmin_log', function (Blueprint $table) {
            $table->comment('操作日誌表');
            $table->id();
            $table->string('route_url', 200)->default('0')->comment('路由');
            $table->string('desc', 255)->nullable()->default('')->comment('操作描述');
            $table->json('log_original')->nullable()->comment('欄位變更前內容');
            $table->json('log_dirty')->nullable()->comment('欄位變更后內容');
            $table->unsignedInteger('admin_user_id')->nullable()->default(0)->comment('操作使用者');
            $table->timestamp('created_at')->nullable()->comment('新增時間');
            $table->timestamp('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('strongadmin_log');
    }
};
