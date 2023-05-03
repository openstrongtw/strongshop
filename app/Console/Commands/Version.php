<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Facades\Strongshop;

class Version extends Command
{

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'strongshop:version';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'strongshop 版本資訊';

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
        $version = Strongshop::getVersion();
        $this->info('strongshop ' . $version);
    }

}
