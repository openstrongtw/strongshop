<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class uploadStaticToOSS extends Command
{

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'strongshop:uploadStatic2oss {--force}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '把前端靜態檔案上傳至oss（預設僅上傳目前更改的檔案）. --force 強制上傳所有檔案';

    /**
     * 上傳的資料夾
     * @var type
     */
    protected $folders = ['css', 'fonts', 'img', 'js', 'plugins', 'vendor'];

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
        foreach ($this->folders as $folder)
        {
            $path = public_path($folder);
            $allFiles = File::allFiles($path);
            foreach ($allFiles as $file)
            {
                if ($this->option('force'))
                {
                    $this->upload($folder, $file);
                } else
                {
                    //目前是否更改過
                    if ($file->getMTime() >= now()->startOfDay()->timestamp && $file->getMTime() <= now()->endOfDay()->timestamp)
                    {
                        $this->upload($folder, $file);
                    }
                }
            }
        }
        $this->info('阿里云 upload [ALL DONE]');
    }

    private function upload($folder, $file)
    {
        $ossPath = "$folder\\" . $file->getRelativePath() . "\\" . $file->getFilename();
        try {
            $contents = file_get_contents($file->getPathname());
            //儲存到阿里云
            if (config('filesystems.disks.oss.driver') === 'oss')
            {
                Storage::disk('oss')->put($ossPath, $contents);
                $this->info("阿里云 upload done: {$file}");
            }
        } catch (\Exception $exc) {
            $this->error("\n Exception: {$exc->getMessage()}\n");
        }
    }

}
