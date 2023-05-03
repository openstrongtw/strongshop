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
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('continent_iso2')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="continent_iso2" value="{{$model->continent_iso2}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('en_name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="en_name" value="{{$model->en_name}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('cn_name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="cn_name" value="{{$model->cn_name}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('iso2')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="iso2" value="{{$model->iso2}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('iso3')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="iso3" value="{{$model->iso3}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('iso_num')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="iso_num" value="{{$model->iso_num}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('capital')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="capital" value="{{$model->capital}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">稅收</label>
                <div class="layui-input-inline">
                    <input type="text" name="more[tax_config][order_amount]" value="{{$model->more['tax_config']['order_amount'] ?? ''}}" autocomplete="off" placeholder="訂單金額" class="layui-input">
                    <div class="layui-word-aux st-form-tip layui-show">訂單金額限制：當 >=訂單金額 才會觸發稅收。</div>
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="more[tax_config][rate]" value="{{$model->more['tax_config']['rate'] ?? ''}}" autocomplete="off" placeholder="稅收比例" class="layui-input">
                    <div class="layui-word-aux st-form-tip layui-show">稅收比例,百分比。例如：0.2，即20%；</div>
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
