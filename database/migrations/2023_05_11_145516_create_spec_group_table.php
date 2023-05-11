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
        Schema::create('spec_group', function (Blueprint $table) {
            $table->comment('產品規格組');
            $table->id()->comment('規格組id');
            $table->string('name', 255)->default('')->comment('規格組名稱');
            $table->dateTime('created_at')->nullable()->comment('建立時間');
            $table->dateTime('updated_at')->nullable()->comment('更新時間');
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
        Schema::dropIfExists('spec_group');
    }
};
