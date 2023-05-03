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
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('logo')}}</label>
                <div class="layui-input-block">
                    <input type="hidden" name="logo" value="{{$model->logo}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-upload">
                        <button type="button" class="layui-btn" id="test1">Upload</button>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="demo1" src="{{$model->logo}}">
                            <p id="demoText"></p>
                        </div>
                    </div>  
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('status')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="開啟" @if($model->status==1)checked @endif>
                    <input type="radio" name="status" value="2" title="禁用" @if($model->status==2)checked @endif>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('sort')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="sort" value="{{$model->sort}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
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
        //普通圖片上傳
        var uploadInst = layui.upload.render({
            elem: '#test1'
            , url: '/strongadmin/upload/image' //改成您自己的上傳介面
            , before: function (obj) {
                //預讀本地檔案示例，不支援ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //圖片鏈接（base64）
                });
            }
            , done: function (res) {
                //如果上傳失敗
                if (res.code > 0) {
                    return layer.msg('上傳失敗');
                }
                //上傳成功
                $(":input[name=logo]").val(res.data.src);
            }
            , error: function () {
                //演示失敗狀態，並實現重傳
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上傳失敗</span> <a class="layui-btn layui-btn-xs demo-reload">重試</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    }();
</script>
@endpush
