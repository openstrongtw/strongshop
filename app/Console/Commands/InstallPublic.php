<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class InstallPublic extends Command
{

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'strongshop:install:public';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '安裝測試產品圖片';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        if (!class_exists('PharData'))
        {
            $this->warn('PharData 類不存在，無法完成 產品安裝');
        }
        $this->line('開始 產品安裝 ...');
        $filepath = storage_path('install/products_images.tar');
        $phar = new \PharData($filepath);
        $phar->extractTo(storage_path('app/public'), null, true);
        $this->info('產品安裝 成功.');
    }

}
