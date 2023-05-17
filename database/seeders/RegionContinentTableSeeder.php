<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class RegionContinentTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('region_continent')->delete();
        
        \DB::table('region_continent')->insert(array (
            0 => 
            array (
                'id' => 1,
                'iso2' => 'AS',
                'cn_name' => '亞洲',
                'en_name' => 'Asia',
                'created_at' => NULL,
                'updated_at' => NULL,
            ),
            1 => 
            array (
                'id' => 2,
                'iso2' => 'EU',
                'cn_name' => '歐洲',
                'en_name' => 'Europe',
                'created_at' => NULL,
                'updated_at' => NULL,
            ),
            2 => 
            array (
                'id' => 3,
                'iso2' => 'AF',
                'cn_name' => '非洲',
                'en_name' => 'Africa',
                'created_at' => NULL,
                'updated_at' => NULL,
            ),
            3 => 
            array (
                'id' => 4,
                'iso2' => 'OC',
                'cn_name' => '大洋洲',
                'en_name' => 'Oceania',
                'created_at' => NULL,
                'updated_at' => NULL,
            ),
            4 => 
            array (
                'id' => 5,
                'iso2' => 'AN',
                'cn_name' => '南極洲',
                'en_name' => 'Antarctica',
                'created_at' => NULL,
                'updated_at' => NULL,
            ),
            5 => 
            array (
                'id' => 6,
                'iso2' => 'NA',
                'cn_name' => '北美洲',
                'en_name' => 'North America',
                'created_at' => NULL,
                'updated_at' => NULL,
            ),
            6 => 
            array (
                'id' => 7,
                'iso2' => 'SA',
                'cn_name' => '南美洲',
                'en_name' => 'South America',
                'created_at' => NULL,
                'updated_at' => '2021-08-07 10:37:54',
            ),
        ));
        
        
    }
}