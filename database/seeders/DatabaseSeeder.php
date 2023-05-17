<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        $this->call(ArticleTableSeeder::class);
        $this->call(StrongadminMenuTableSeeder::class);
        $this->call(StrongadminRoleTableSeeder::class);
        $this->call(WebconfigTableSeeder::class);
        $this->call(RegionCityTableSeeder::class);
        $this->call(RegionContinentTableSeeder::class);
        $this->call(RegionCountryTableSeeder::class);
    }
}
