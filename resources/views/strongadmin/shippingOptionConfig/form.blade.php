@extends('strongadmin::layouts.app')

@push('styles')
<style>
    /*.layui-form-label{width:150px;}*/
</style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h15"></div>
<form class="layui-form" action="">
    <input name="id" type="hidden" value="{{$model->id}}" />
    <input name="shipping_option_id" type="hidden" value="{{$model->shipping_option_id ?: request('shipping_option_id')}}" />
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class="layui-this">基礎配置</li>
            <li>國家</li>
        </ul>
        <div class="layui-tab-content">
            <!--基礎資訊-->
            <div class="layui-tab-item layui-show">
                <div class="layui-form-item">
                    <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('title')}}</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" value="{{$model->title}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('status')}}</label>
                    <div class="layui-input-block">
                        <input type="radio" name="status" value="1" title="啟用" @if($model->status==1)checked @endif>
                        <input type="radio" name="status" value="2" title="禁用" @if($model->status==2)checked @endif>
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
                <hr/>
                <p>
                    <a href="{{request()->fullUrlWithQuery(['create'=>1])}}" class="layui-btn">新增公式</a>
                </p>
                @isset($model->more['range_wieght'])
                @foreach($model->more['range_wieght'] as $wieght)
                <fieldset class="layui-elem-field" style="margin-top: 30px;">
                    <legend>公式{{$loop->iteration}} <a href="{{request()->fullUrlWithQuery(['removeRule'=>$loop->index])}}" class="layui-btn layui-btn-xs">刪除公式</a></legend>
                    <div class="layui-field-box">
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">重量範圍（g）</label>
                            <div class="layui-input-inline">
                                <input type="text" name="more[range_wieght][{{$loop->index}}][range][start]" value="{{$wieght['range']['start']}}" {{$loop->index ==0 ? "readonly" : ""}} autocomplete="off" placeholder="起始值" class="layui-input">
                            </div>
                            <div class="layui-form-mid">-</div>
                            <div class="layui-input-inline">
                                <input type="text" name="more[range_wieght][{{$loop->index}}][range][end]" value="{{$wieght['range']['end']}}" autocomplete="off" placeholder="結束值" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">首重($ / g)</label>
                            <div class="layui-input-inline">
                                <input type="text" name="more[range_wieght][{{$loop->index}}][first_weight][amount]" value="{{$wieght['first_weight']['amount']}}" autocomplete="off" placeholder="費用" class="layui-input">
                            </div>
                            <div class="layui-form-mid">{{config('strongshop.defaultCurrencyBackend')}} / </div>
                            <div class="layui-input-inline">
                                <input type="text" name="more[range_wieght][{{$loop->index}}][first_weight][weight]" value="{{$wieght['first_weight']['weight']}}" autocomplete="off" placeholder="重量" class="layui-input">
                            </div>
                            <div class="layui-form-mid">克</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">續重($ / g)</label>
                            <div class="layui-input-inline">
                                <input type="text" name="more[range_wieght][{{$loop->index}}][continued_weight][amount]" value="{{$wieght['continued_weight']['amount']}}" autocomplete="off" placeholder="費用" class="layui-input">
                            </div>
                            <div class="layui-form-mid">{{config('strongshop.defaultCurrencyBackend')}} / </div>
                            <div class="layui-input-inline">
                                <input type="text" name="more[range_wieght][{{$loop->index}}][continued_weight][weight]" value="{{$wieght['continued_weight']['weight']}}" autocomplete="off" placeholder="重量" class="layui-input">
                            </div>
                            <div class="layui-form-mid">克</div>
                        </div>
                    </div>
                </fieldset>
                @endforeach
                <div class="layui-form-item">
                    <label class="layui-form-label st-form-input-required">超出範圍($/g)</label>
                    <div class="layui-input-inline">
                        <input type="text" name="more[over_weight][amount]" value="{{$model->more['over_weight']['amount']}}" autocomplete="off" placeholder="費用" class="layui-input">
                    </div>
                    <div class="layui-form-mid">{{config('strongshop.defaultCurrencyBackend')}} / </div>
                    <div class="layui-input-inline">
                        <input type="text" name="more[over_weight][weight]" value="{{$model->more['over_weight']['weight']}}" autocomplete="off" placeholder="重量" class="layui-input">
                    </div>
                    <div class="layui-form-mid">克</div>
                </div>
                @endisset
            </div>
            <!--配置資訊-->
            <div class="layui-tab-item">
                @foreach($countries as $country)
                <span style="display: inline-block;width:300px;overflow: hidden;">
                    <input @if($model->countries && in_array($country->iso2,$model->countries)) checked="" @endif type="checkbox" name="countries[]" lay-skin="primary" title="{{$country->en_name}} {{$country->cn_name}}" value="{{$country->iso2}}">
                </span>
                @endforeach

            </div>
        </div>
    </div>
    <div class="layui-form-item st-form-submit-btn">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="ST-SUBMIT">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
@endsection

@push('scripts_bottom')
<script>
    !function () {
        $("fieldset>legend>button").click(function () {
            $(this).parent().parent().remove();
        });
        layui.form.on('submit(ST-SUBMIT)', function (data) {
            Util.postForm('form.layui-form', data.field, false);
            return false;
        });
    }();
</script>
@endpush
