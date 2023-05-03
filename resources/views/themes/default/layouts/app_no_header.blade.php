<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="renderer" content="webkit">
        <meta name="keywords" content="{{$_meta_keywords ?? ''}}">
        <meta name="description" content="{{$_meta_description ?? ''}}">
        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>@if(isset($_title)){{$_title}} - {{ config('strongshop.storeName') }}@else {{app('strongshop')->getShopConfig('store_title')}} @endif</title>
        <!-- Styles -->
        <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
        <link rel="stylesheet" href="{{ asset('css/bootstrap-theme.min.css') }}">
        <link rel="stylesheet" href="{{ asset('css/bootstrap-icons.css') }}">
        <link rel="stylesheet" href="{{ asset('css/main.css') }}?v={{env('APP_VERSION')}}">
        <!-- Scripts 相容 ie8 自適應 -->
        <script src="{{ asset('js/vendor/modernizr-2.8.3-respond-1.4.2.min.js') }}"></script>
        @stack('styles')
        @stack('scripts')
    </head>
    <body id="app" class="st">

        @yield('content')
        
        <!-- Scripts -->
        <script src="{{ asset('js/vendor/jquery-1.11.2.min.js') }}"></script>
        <script src="{{ asset('js/vendor/jquery.form.min.js') }}"></script>
        <script src="{{ asset('js/vendor/jquery.cookie.js') }}"></script>
        <script src="{{ asset('js/vendor/bootstrap.min.js') }}"></script>
        <script src="{{ asset('js/vendor/bootstrap-hover-dropdown.js') }}"></script>
        <script src="{{ asset('plugins/layer/layer.js') }}"></script>
        <script src="{{ asset('js/main.js') }}?v={{env('APP_VERSION')}}"></script>
        <script>
//js 初始化
            Util.init();
        </script>
        @stack('scripts_bottom')
    </body>
</html>
