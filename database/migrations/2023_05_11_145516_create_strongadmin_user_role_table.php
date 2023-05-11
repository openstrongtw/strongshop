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
        Schema::create('strongadmin_user_role', function (Blueprint $table) {
            $table->unsignedBigInteger('admin_user_id');
            $table->unsignedBigInteger('admin_role_id');
            $table->primary(['admin_user_id', 'admin_role_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('strongadmin_user_role');
    }
};
