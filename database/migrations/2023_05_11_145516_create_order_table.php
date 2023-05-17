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
        Schema::create('order', function (Blueprint $table) {
            $table->comment('訂單表');
            $table->id()->comment('訂單id');
            $table->unsignedBigInteger('user_id')->default(0)->comment('會員id');
            $table->string('order_no', 100)->default('')->unique('order_no')->comment('訂單編號');
            $table->string('currency_code', 50)->default('')->comment('結算貨幣');
            $table->unsignedDecimal('currency_rate', 10, 6)->default(1)->comment('結算貨幣轉換率');
            $table->unsignedDecimal('products_amount', 10, 3)->default(0)->comment('產品總額');
            $table->unsignedInteger('weight_total')->default(0)->comment('產品總重量：g');
            $table->unsignedDecimal('shipping_fee', 10, 3)->default(0)->comment('配送費用');
            $table->unsignedDecimal('handling_fee', 10, 3)->default(0)->comment('支付費用 （支付手續費）');
            $table->unsignedDecimal('tax_fee', 10, 3)->default(0)->comment('稅收費用');
            $table->unsignedDecimal('discount_amount', 10, 3)->default(0)->comment('優惠金額');
            $table->unsignedDecimal('used_credits_amount', 10, 3)->default(0)->comment('積分金額');
            $table->unsignedDecimal('order_amount', 10, 3)->default(0)->comment('訂單金額 （應付金額）');
            $table->unsignedDecimal('paid_amount', 10, 3)->default(0)->comment('已付金額');
            $table->integer('order_status')->default(0)->comment('訂單狀態：10 待支付，12 已支付/待發貨，13 支付失敗，14 支付異常，20 已發貨/待收貨，22 已收貨，24 退貨中，26 已退貨，30 已完成，40 已取消（會員取消），42 已關閉(管理員關閉)');
            $table->string('pay_remark', 255)->default('')->comment('支付備註');
            $table->integer('shipping_option_id')->default(0)->comment('配送id');
            $table->string('tracking_no', 255)->default('')->comment('物流跟蹤單號');
            $table->string('shipping_remark', 255)->default('')->comment('配送備註：可填寫具體配送公司等資訊，此資訊在前臺訂單詳情顯示');
            $table->unsignedBigInteger('payment_option_id')->default(0)->comment('支付id');
            $table->string('transaction_id', 255)->default('')->comment('支付平臺流水號id');
            $table->string('remark', 255)->default('')->comment('訂單備註');
            $table->string('first_name', 255)->default('')->comment('名');
            $table->string('last_name', 255)->default('')->comment('姓');
            $table->string('email', 255)->default('');
            $table->string('phone', 255)->default('')->comment('聯繫電話');
            $table->string('fax', 255)->nullable()->default('')->comment('傳真');
            $table->string('country_code', 255)->default('')->comment('國家');
            $table->string('state_code', 255)->default('')->comment('省');
            $table->string('state_other', 255)->nullable()->default('')->comment('其他省');
            $table->string('city', 255)->default('')->comment('城市');
            $table->string('address_line_1', 255)->default('')->comment('地址1');
            $table->string('address_line_2', 255)->nullable()->default('')->comment('地址2');
            $table->string('postal_code', 255)->default('')->comment('郵編');
            $table->string('billing_first_name', 255)->default('')->comment('名(賬單)');
            $table->string('billing_last_name', 255)->default('')->comment('姓(賬單)');
            $table->string('billing_email', 255)->default('')->comment('Email(賬單)');
            $table->string('billing_phone', 255)->default('')->comment('聯繫電話(賬單)');
            $table->string('billing_fax', 255)->nullable()->default('')->comment('傳真(賬單)');
            $table->string('billing_country_code', 255)->default('')->comment('國家(賬單)');
            $table->string('billing_state_code', 255)->default('')->comment('省(賬單)');
            $table->string('billing_state_other', 255)->nullable()->default('')->comment('其他省(賬單)');
            $table->string('billing_city', 255)->default('')->comment('城市(賬單)');
            $table->string('billing_address_line_1', 255)->default('')->comment('地址1(賬單)');
            $table->string('billing_address_line_2', 255)->nullable()->default('')->comment('地址2(賬單)');
            $table->string('billing_postal_code', 255)->default('')->comment('郵編(賬單)');
            $table->dateTime('created_at')->nullable()->comment('建立時間');
            $table->dateTime('updated_at')->nullable()->comment('更新時間');
            $table->dateTime('deleted_at')->nullable()->comment('刪除時間');
            $table->dateTime('paid_at')->nullable()->comment('支付時間');
            $table->dateTime('received_at')->nullable()->comment('確認收貨時間');
            $table->dateTime('canceled_at')->nullable()->comment('取消訂單時間');
            $table->dateTime('returned_at')->nullable()->comment('退貨時間');
            $table->dateTime('shipped_at')->nullable()->comment('發貨時間');
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
        Schema::dropIfExists('order');
    }
};
