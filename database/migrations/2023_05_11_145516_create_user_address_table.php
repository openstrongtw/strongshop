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
        Schema::create('user_address', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->default(0);
            $table->string('first_name', 255)->default('')->comment('名');
            $table->string('last_name', 255)->default('')->comment('姓');
            $table->string('email', 255)->default('');
            $table->string('phone', 255)->default('')->comment('聯繫電話');
            $table->string('fax', 255)->nullable()->default('')->comment('傳真');
            $table->string('country_code', 255)->default('')->comment('國家');
            $table->string('state_code', 255)->default('')->comment('省');
            $table->string('state_other', 255)->nullable()->default('')->comment('其他省');
            $table->string('city', 255)->default('')->comment('城市');
            $table->string('address_line_1', 255)->default('')->comment('地址1');
            $table->string('address_line_2', 255)->nullable()->default('')->comment('地址2');
            $table->string('postal_code', 255)->default('')->comment('郵編');
            $table->integer('is_default')->default(2)->comment('預設地址 1 是，2 否');
            $table->dateTime('created_at')->nullable();
            $table->dateTime('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_address');
    }
};
