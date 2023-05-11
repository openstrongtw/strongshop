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
        Schema::create('region_continent', function (Blueprint $table) {
            $table->comment('全球7大洲');
            $table->id();
            $table->string('iso2', 10)->nullable()->comment('ISO二字程式碼');
            $table->string('cn_name', 16)->nullable()->comment('中文名');
            $table->string('en_name', 16)->nullable()->comment('英文名');
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
        Schema::dropIfExists('region_continent');
    }
};
