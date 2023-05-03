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
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('spec_group_id')}}</label>
                <div class="layui-input-inline">
                    <select name="spec_group_id" {{$isUpdate ? 'disabled' : ''}}>
                        <option value=""> -- </option>
                        @foreach ($specGroups as $specGroup)
                        <option value="{{$specGroup->id}}" @if($model->spec_group_id == $specGroup->id)selected @endif>{{$specGroup->name}}</option>
                        @endforeach
                    </select>
                    <div class="layui-word-aux st-form-tip layui-show"></div>
                </div>
                @if(!isset($isUpdate))
                <div class="layui-input-inline">
                    <a class="layui-btn" onclick="Util.createFormWindow('/strongadmin/product/specGroup/create', this.innerText, ['60%', '60%']);">新建規格組</a>
                </div>
                @endif
            </div>
            @if($_multiLanguageBackend)
            <div class="layui-form-item st-input-multiLanguage">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('name')}}</label>
                <div class="layui-input-block">
                    <div class="layui-tab layui-tab-card">
                        <ul class="layui-tab-title">
                            @foreach(config('strongshop.langs') as $lang)
                            <li @if ($loop->first) class="layui-this" @endif>{{$lang['name']}} [{{$lang['code']}}]</li>
                            @endforeach
                        </ul>
                        <div class="layui-tab-content">
                            @foreach(config('strongshop.langs') as $lang)
                            <div class="layui-tab-item @if($loop->first)layui-show @endif">
                                <input type="text" name="name[{{$lang['code']}}]" value="{{$model->name[$lang['code']] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            @else
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="name" value="{{$model->name}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
                </div>
            </div>
            @endif
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('spec_type')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="spec_type" value="1" title="價格規格" @if($model->spec_type==1)checked @endif  {{$isUpdate ? 'disabled' : ''}} lay-filter="spec_type" />
                    <input type="radio" name="spec_type" value="2" title="普通規格" @if($model->spec_type==2)checked @endif  {{$isUpdate ? 'disabled' : ''}} lay-filter="spec_type" />
                    <div class="layui-word-aux st-form-tip layui-show">價格規格：作為產品價格屬性選擇。普通規格：作為普通產品參數顯示</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('input_type')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="input_type" value="1" title="下拉選擇" @if($model->input_type==1)checked @endif @if($model->spec_type==1) disabled @endif lay-filter="input_type" />
                    <input type="radio" name="input_type" value="2" title="文字輸入" @if($model->input_type==2)checked @endif @if($model->spec_type==1) disabled @endif lay-filter="input_type" />
                    <div class="layui-word-aux st-form-tip layui-show">建立產品時產品規格的錄入方式</div>
                </div>
            </div>
            <div class="layui-form-item" @if($model->input_type==2) style="display:none;" @endif >
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('select_values')}}</label>
                <div class="layui-input-block">
                    <textarea name="select_values" autocomplete="off" placeholder="多個值回車換行" class="layui-textarea" >{{$model->select_values}}</textarea>
                    <div class="layui-word-aux st-form-tip layui-show">當錄入方式為 下拉選擇 時有效。多個值回車換行</div>
                </div>
            </div>
            <div class="layui-form-item" @if($model->spec_type==2) style="display:none;" @endif >
                <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('is_show_img')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="is_show_img" value="1" title="顯示" @if($model->is_show_img==1)checked @endif>
                    <input type="radio" name="is_show_img" value="2" title="不顯示" @if($model->is_show_img==2)checked @endif>
                    <div class="layui-word-aux st-form-tip layui-show">在產品詳情中進行規格選擇時是否以`圖片`形式顯示</div>
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
        layui.form.on('radio(spec_type)', function (data) {
            if (data.value == 1) {
                $(":radio[name='is_show_img']").parent().parent().show();
                $(":radio[name='input_type'][value=1]").prop('checked', true);
                $(":radio[name='input_type']").prop('disabled', true);
                $(":input[name='select_values']").parent().parent().show();
            } else {
                $(":radio[name='is_show_img']").parent().parent().hide();
                $(":radio[name='input_type']").prop('disabled', false);
            }
            layui.form.render();
        });
        layui.form.on('radio(input_type)', function (data) {
            if (data.value == 1) {
                $(":input[name='select_values']").parent().parent().show();
            } else {
                $(":input[name='select_values']").parent().parent().hide();
            }
        });
    }();
</script>
@endpush
