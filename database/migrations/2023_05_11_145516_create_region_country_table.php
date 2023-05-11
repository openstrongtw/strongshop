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
        Schema::create('region_country', function (Blueprint $table) {
            $table->comment('國家');
            $table->id()->comment('自增id');
            $table->string('continent_iso2', 255)->nullable()->comment('大陸簡碼');
            $table->string('en_name', 255)->nullable()->comment('英文名稱');
            $table->string('cn_name', 255)->nullable()->comment('中文名稱');
            $table->string('iso2', 255)->nullable()->comment('ISO二字簡碼');
            $table->string('iso3', 255)->nullable()->comment('ISO三字簡碼');
            $table->string('iso_num', 255)->nullable()->comment('ISO數字程式碼');
            $table->string('capital', 255)->nullable()->comment('首都');
            $table->json('more')->nullable()->comment('更多配置');
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
        Schema::dropIfExists('region_country');
    }
};
