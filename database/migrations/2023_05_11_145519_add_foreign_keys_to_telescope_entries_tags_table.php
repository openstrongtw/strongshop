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
        Schema::table('telescope_entries_tags', function (Blueprint $table) {
            $table->foreign(['entry_uuid'], 'st_telescope_entries_tags_entry_uuid_foreign')->references(['uuid'])->on('st_telescope_entries')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('telescope_entries_tags', function (Blueprint $table) {
            $table->dropForeign('st_telescope_entries_tags_entry_uuid_foreign');
        });
    }
};
