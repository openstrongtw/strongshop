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
        Schema::create('strongadmin_role', function (Blueprint $table) {
            $table->comment('角色表');
            $table->id()->comment('角色id');
            $table->string('name', 50)->default('')->unique('uniq_name')->comment('名稱');
            $table->string('desc', 255)->nullable()->default('')->comment('角色描述');
            $table->json('permissions')->nullable()->comment('擁有的許可權(route_url)');
            $table->dateTime('created_at')->nullable()->comment('新增時間');
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
        Schema::dropIfExists('strongadmin_role');
    }
};
