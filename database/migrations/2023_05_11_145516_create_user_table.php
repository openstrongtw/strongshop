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
        Schema::create('user', function (Blueprint $table) {
            $table->comment('會員表');
            $table->id()->comment('會員id');
            $table->string('first_name', 255)->nullable()->default('')->comment('名');
            $table->string('last_name', 255)->nullable()->default('')->comment('姓');
            $table->string('nickname', 255)->nullable()->default('')->comment('昵稱');
            $table->string('user_name', 100)->nullable()->unique('uniq_user_name')->comment('登錄名稱');
            $table->string('email', 100)->nullable()->unique('uniq_email')->comment('登錄郵箱');
            $table->dateTime('email_verified_at')->nullable()->comment('郵箱驗證時間');
            $table->string('mobile', 100)->nullable()->unique('uniq_mobile')->comment('手機號碼');
            $table->dateTime('mobile_verified_at')->nullable()->comment('手機號驗證時間');
            $table->string('password', 255)->nullable()->default('')->comment('登錄密碼');
            $table->rememberToken()->default('');
            $table->string('api_token', 100)->nullable()->unique('uniq_api_token')->comment('api token');
            $table->dateTime('api_token_at')->nullable()->comment('api token 有效期至');
            $table->dateTime('api_token_refresh_at')->nullable()->comment('api token 重新整理時間');
            $table->dateTime('created_at')->nullable()->comment('註冊時間');
            $table->dateTime('updated_at')->nullable()->comment('更新時間');
            $table->dateTime('deleted_at')->nullable()->comment('刪除時間');
            $table->unsignedInteger('status')->default(1)->comment('狀態 1 正常, 2 禁止登錄');
            $table->dateTime('last_login_at')->nullable()->comment('最近一次登錄日期');
            $table->string('last_login_ip', 255)->nullable()->default('')->comment('最近一次登錄ip');
            $table->string('avatar', 500)->nullable()->default('')->comment('頭像');
            $table->unsignedInteger('gender')->nullable()->default(0)->comment('性別 0未知, 1男, 2女');
            $table->date('birthday')->nullable()->comment('生日');
            $table->string('country_code', 255)->default('')->comment('國家 code');
            $table->string('wechat_open_id', 100)->nullable()->unique('uniq_wechat_open_id')->comment('微信openid');
            $table->string('wechat_union_id', 100)->nullable()->unique('uniq_wechat_union_id')->comment('微信unionid');
            $table->string('qq_open_id', 100)->nullable()->unique('uniq_qq_open_id')->comment('QQ開放id');
            $table->string('weibo_open_id', 100)->nullable()->comment('微博開放id');
            $table->string('facebook_open_id', 100)->nullable()->unique('uniq_facebook_open_id')->comment('Facebook開放id');
            $table->string('google_open_id', 100)->nullable()->unique('uniq_google_open_id')->comment('Google開放id');
            $table->unsignedInteger('pay_credits')->default(0)->comment('支付積分（可用於支付）');
            $table->unsignedInteger('rank_credits')->default(0)->comment('信用積分（用於評級）');
            $table->string('source', 255)->default('')->comment('來源');
            $table->string('http_referer', 255)->default('')->comment('HTTP_REFERER');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user');
    }
};
