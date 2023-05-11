<?php

namespace App\Providers;

use Illuminate\Database\QueryException;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Pagination\Paginator;
use App\Repositories\AppRepository;
use App\Repositories\BladeRepository;

class StrongShopServiceProvider extends ServiceProvider
{

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //單例繫結
        $this->app->singleton('strongshop', function ($app) {
            return new AppRepository();
        });
        //app store
        $this->appStore();
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //修改 Strongshop 配置資訊: 郵箱配置等
        $this->configStrongshop();

        //\Illuminate\Support\Facades\View::addLocation(resource_path('views'));
        //分頁檢視
        Paginator::defaultView('vendor.pagination.default');
        Paginator::defaultSimpleView('vendor.pagination.simple-default');
        // 配置檢視全域性變數
        View::composer('*', 'App\Http\View\Composers\GlobalStrongShopComposer');
        //layouts 佈局變數
        View::composer('layouts/app', 'App\Http\View\Composers\LayoutsComposer');
        //購物車
        View::composer(['layouts/app', 'shoppingcart/index'], 'App\Http\View\Composers\ShoppingCartComposer');

        //自定義 blade 指令
        BladeRepository::setPriceBlade();
    }

    /**
     * 修改Strongshop配置資訊: 郵箱配置等
     */
    private function configStrongshop()
    {
        try {
            AppRepository::changeConfig();
        } catch (QueryException) {

        }
    }

    /**
     * app store
     */
    private function appStore()
    {
        $this->registerConfigs();
        $this->registerCommands();
        $this->registerRoutes();
        $this->registerMigrations();
        $this->registerPublishing();
        $this->registerViews();
        $this->registerTranslations();
        $this->registerJsonTranslations();
        $this->registerListeners();
    }

    private function registerConfigs()
    {

    }

    private function registerCommands()
    {

    }

    /**
     * Register the package routes.
     *
     * @return void
     */
    private function registerRoutes()
    {

    }

    /**
     * Register the package's migrations.
     *
     * @return void
     */
    private function registerMigrations()
    {
        if ($this->app->runningInConsole())
        {

        }
    }

    /**
     * Register the package's publishable resources.
     *
     * @return void
     */
    private function registerPublishing()
    {
        if ($this->app->runningInConsole())
        {

        }
    }

    /**
     * Register a view file namespace.
     */
    private function registerViews()
    {

    }

    /**
     * Register a translation file namespace.
     */
    private function registerTranslations()
    {

    }

    /**
     * Register a JSON translation file path.
     */
    private function registerJsonTranslations()
    {

    }

    /**
     * Register Listeners
     */
    private function registerListeners()
    {

    }

}
