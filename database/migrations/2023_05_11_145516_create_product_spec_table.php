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
        Schema::create('product_spec', function (Blueprint $table) {
            $table->unsignedBigInteger('product_id')->default(0)->comment('產品id');
            $table->integer('spec_id')->default(0)->comment('規格id');
            $table->integer('spec_type')->default(1)->comment('規格型別：1 價格規格，2 普通規格');
            $table->string('spec_value', 255)->comment('規格值');
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
        Schema::dropIfExists('product_spec');
    }
};
