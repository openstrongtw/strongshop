<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="renderer" content="webkit">
        <title>{{config('app.name')}} 管理後臺</title>
        <link rel="stylesheet" href="/vendor/strongadmin/plugins/layui/css/layui.css">
        <link rel="stylesheet" href="/vendor/strongadmin/css/app.css">
        <style>
            .layui-layout-admin .layui-logo{
                overflow: hidden;
            }
        </style>
    </head>
    <body class="layui-layout-body">
        <div class="layui-layout layui-layout-admin">
            <div class="layui-header">
                <div class="layui-logo" title="{{config('app.name')}} 後臺管理">{{config('app.name')}} 後臺管理</div>
                <!-- 頭部區域（可配合layui已有的水平導航） -->
                <ul class="layui-nav layui-layout-left">
                    <li class="layui-nav-item"><a href="{{route('strongadmin.panel')}}" target="mainBody">面板</a></li>
                    <li class="layui-nav-item"><a href="/strongadmin/order/index" target="mainBody">訂單管理</a></li>
                    <li class="layui-nav-item"><a href="/strongadmin/user/index" target="mainBody">會員管理</a></li>
                    <li class="layui-nav-item"><a href="/strongadmin/user/feedback/index" target="mainBody">意見反饋</a></li>
                    <!--                                        <li class="layui-nav-item">
                                                                <a href="javascript:;">其它系統</a>
                                                                <dl class="layui-nav-child">
                                                                    <dd><a href="">郵件管理</a></dd>
                                                                    <dd><a href="">訊息管理</a></dd>
                                                                    <dd><a href="">授權管理</a></dd>
                                                                </dl>
                                                            </li>-->
                </ul>
                <ul class="layui-nav layui-layout-right">
                    <li class="layui-nav-item"><a href="/" target="_blank">網站首頁</a></li>
                    <li class="layui-nav-item"><a href="/strongadmin/webconfig/clearcache" target="mainBody">清除快取</a></li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon layui-icon-username" style="font-size:20px;"></i>
                            {{auth(config('strongadmin.guard'))->user()->name ?: auth(config('strongadmin.guard'))->user()->user_name}}
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="{{route('strongadmin.logout')}}">退出</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>

            <div class="layui-side layui-bg-black st-leftmenu">
                <div class="layui-side-scroll">
                    <!-- 左側導航區域（可配合layui已有的垂直導航） -->
                    <ul class="layui-nav layui-nav-tree" style="min-height: 1000px;">
                        @foreach($rows as $row)
                        <!--預設展開菜單 請追加樣式 「layui-nav-itemed」-->
                        <li class="layui-nav-item">
                            <a href="javascript:;">{{$row->name}}</a>
                            <dl class="layui-nav-child">
                                @foreach($row->children as $child)
                                <dd @if($default_url==$child->route_url)class="layui-this" @endif >
                                    @if(preg_match('/^https?:/i',$child->route_url))
                                    <a href="{{$child->route_url}}" target="mainBody">{{$child->name}}</a>
                                    @else
                                    <a href="/{{$child->route_url}}" target="mainBody">{{$child->name}}</a>
                                    @endif
                                </dd>
                                @endforeach
                            </dl>
                        </li>
                        @endforeach
                    </ul>
                </div>
            </div>

            <div class="layui-body st-iframe-body">
                <!-- 內容主體區域 -->
                <iframe src="/{{$default_url}}" name="mainBody" frameborder="0" scrolling="yes"></iframe>
            </div>

            <!-- 底部固定區域 -->
            <!--            <div class="layui-footer st-footer">
                            底部固定區域
                        </div>-->
        </div>
        <script src="/vendor/strongadmin/plugins/jquery/jquery-3.5.1.min.js"></script>
        <script src="/vendor/strongadmin/plugins/layui/layui.js"></script>
        <script>
$(".layui-nav-tree li dl dd a").click(function () {
    $("ul.layui-nav li").removeClass('layui-this');
});
        </script>
    </body>
</html>