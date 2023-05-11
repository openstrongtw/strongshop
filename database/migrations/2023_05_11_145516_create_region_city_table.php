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
        Schema::create('region_city', function (Blueprint $table) {
            $table->id();
            $table->string('country', 256)->nullable();
            $table->string('state', 256)->nullable();
            $table->string('city', 256)->nullable();
            $table->string('state_code', 64)->nullable();
            $table->string('city_code', 64)->nullable();
            $table->string('cn_city', 256)->nullable();
            $table->string('cn_state', 256)->nullable();
            $table->string('cn_country', 256)->nullable()->default('');
            $table->string('country_code', 64)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('region_city');
    }
};
