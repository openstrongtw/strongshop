@extends('strongadmin::layouts.app')

@push('styles')
<style>
    body{
        background:#eee;
    }
    .layadmin-backlog .layadmin-backlog-body {
        display: block;
        padding: 10px 15px;
        background-color: #f8f8f8;
        color: #999;
        border-radius: 2px;
        transition: all .3s;
        -webkit-transition: all .3s;
    }
    .layadmin-backlog-body h3 {
        padding-bottom: 10px;
        font-size: 12px;
    }
    .layadmin-backlog-body p cite {
        font-style: normal;
        font-size: 30px;
        font-weight: 300;
        color: #009688;
    }
</style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h20"></div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">提醒事項</div>
                <div class="layui-card-body">
                    <div class="layui-carousel layadmin-carousel layadmin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 180px;">
                        <div carousel-item="">
                            <ul class="layui-row layui-col-space10 layui-this">
                                <li class="layui-col-xs4">
                                    <a href="/strongadmin/order/index?order_status=12" class="layadmin-backlog-body" target="mainBody">
                                        <h3>待發貨</h3>
                                        <p><cite>{{$order_count_paid}}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-xs4">
                                    <a href="/strongadmin/order/index?order_status=10" class="layadmin-backlog-body" target="mainBody">
                                        <h3>待付款</h3>
                                        <p><cite>{{$order_count_unpaid}}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-xs4">
                                    <a href="/strongadmin/order/index" class="layadmin-backlog-body" target="mainBody">
                                        <h3>今日訂單</h3>
                                        <p><cite>{{$order_count_today}}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-xs4">
                                    <a href="/strongadmin/user/feedback/index?status=1" class="layadmin-backlog-body" target="mainBody">
                                        <h3>待回覆反饋</h3>
                                        <p><cite>{{$userfeedback_noreply_count}}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-xs4">
                                    <a href="/strongadmin/product/index" class="layadmin-backlog-body" target="mainBody">
                                        <h3>庫存警告</h3>
                                        <p><cite>{{$product_stock_warning}}</cite></p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">數據總計</div>
                <div class="layui-card-body">
                    <div class="layui-carousel layadmin-carousel layadmin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 180px;">
                        <div carousel-item="">
                            <ul class="layui-row layui-col-space10 layui-this">
                                <li class="layui-col-xs4 layadmin-backlog-body">
                                    <h3>會員總數</h3>
                                    <p><cite>{{$total['users']}}</cite></p>
                                </li>
                                <li class="layui-col-xs4 layadmin-backlog-body">
                                    <h3>產品總數</h3>
                                    <p><cite>{{$total['products']}}</cite></p>
                                </li>
                                <li class="layui-col-xs4 layadmin-backlog-body">
                                    <h3>訂單總數</h3>
                                    <p><cite>{{$total['orders']}}</cite></p>
                                </li>
                                <li class="layui-col-xs4 layadmin-backlog-body">
                                    <h3>評論總數</h3>
                                    <p><cite>{{$total['product_comments']}}</cite></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">系統環境&版本</div>
                <div class="layui-card-body">
                    <table class="layui-table">
                        <tbody>
                            <tr>
                                <td>操作系統</td>
                                <td>{{$version['os']}}</td>
                            </tr>
                            <tr>
                                <td>應用名稱</td>
                                <td>{{$version['app.name']}}</td>
                            </tr>
                            <tr>
                                <td>應用環境</td>
                                <td>{{$version['app.env']}}</td>
                            </tr>
                            <tr>
                                <td>應用 Debug</td>
                                <td>{{$version['app.debug'] ? 'true' : 'false'}}</td>
                            </tr>
                            <tr>
                                <td>strongshop</td>
                                <td>{{$version['strongshop']}}</td>
                            </tr>
                            <tr>
                                <td>Laravel Framework</td>
                                <td>{{$version['laravel']}}</td>
                            </tr>
                            <tr>
                                <td>PHP</td>
                                <td>{{$version['php']}}</td>
                            </tr>
                            <tr>
                                <td>Web Server</td>
                                <td>{{$version['nginx']}}</td>
                            </tr>
                            <tr>
                                <td>MySQL</td>
                                <td>{{$version['mysql']}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @endsection

    @push('scripts_bottom')

    @endpush
