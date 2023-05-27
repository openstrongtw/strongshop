<?php

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
        $this->call(\Database\Seeders\ArticleTableSeeder::class);
        $this->call(\Database\Seeders\RegionCityTableSeeder::class);
        $this->call(\Database\Seeders\RegionCountryTableSeeder::class);
        $this->call(\Database\Seeders\RegionContinentTableSeeder::class);
        $this->call(\Database\Seeders\WebconfigTableSeeder::class);
        $this->call(\Database\Seeders\StrongAdminMenuSeeder::class);
    }
}
