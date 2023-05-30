@extends('strongadmin::layouts.app')

@push('styles')
<style></style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h15"></div>
<form class="layui-form" action="">
    <input name="id" type="hidden" value="{{$model->id}}" />
    <div class="layui-row">
        <div class="layui-col-xs11">
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('title')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="title" value="{{$model->title}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('desc')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="desc" value="{{$model->desc}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('code')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="code" value="{{$model->code}}" autocomplete="off" placeholder="" class="layui-input">
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
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">收款帳號</label>
                <div class="layui-input-block">
                    <input type="text" name="more[business]" value="{{$model->more['business'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip layui-show">沙盒測試環境帳號：sb-nq75t7063330@business.example.com</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>手續費</label>
                <div class="layui-input-block">
                    <input type="text" name="more[rate]" value="{{$model->more['rate'] ?? ''}}" autocomplete="off" placeholder="5% 按比例收取； 20 按金額收取" class="layui-input">
                    <div class="layui-word-aux st-form-tip layui-show">如果包含 % 則按比例收取，否則按該數字金額收取</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>結算貨幣</label>
                <div class="layui-input-block">
                    <input type="text" name="more[currency]" value="{{$model->more['currency'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip layui-show">結算貨幣，不設定則自動識別</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>環境</label>
                <div class="layui-input-block">
                    <select name="more[env]">
                        <option value="sandbox" @if(isset($model->more['env']) && $model->more['env']=='sandbox') selected @endif > Sandbox 沙盒測試環境 </option>
                        <option value="live" @if(isset($model->more['env']) && $model->more['env']=='live') selected @endif > 正式環境 </option>
                    </select>
                    <div class="layui-word-aux st-form-tip layui-show">如果是 正式環境，請修改`收款帳號`為正式商戶收款帳號</div>
                </div>
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
        //...
    }();
</script>
@endpush
