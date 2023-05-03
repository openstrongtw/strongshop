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
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('category_id')}}</label>
                <div class="layui-input-block">
                    <select name="category_id" lay-ignore>
                        @foreach ($categories as $category)
                        @if(count($category->children)>0)
                        <optgroup label="{{$category->name_label}}">
                            @foreach ($category->children as $child)
                            <option value="{{$child->id}}" @if($model->category_id == $child->id)selected @endif>{{$child->name_label}}</option>
                            @endforeach
                        </optgroup>
                        @else
                        <option value="{{$category->id}}" @if($model->category_id == $category->id)selected @endif>{{$category->name_label}}</option>
                        @endif
                        @endforeach
                    </select>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            @if($_multiLanguageBackend)
            <div class="layui-form-item st-input-multiLanguage">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('title')}}</label>
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
                                <input type="text" name="title[{{$lang['code']}}]" value="{{$model->title[$lang['code']] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            @else
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('title')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="title" value="{{$model->title}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            @endif
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('postid')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="postid" value="{{$model->postid}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>

            @if($_multiLanguageBackend)
            <div class="layui-form-item st-input-multiLanguage">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('content')}}</label>
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
                                <div class="layui-row" id="wangEditors">
                                    <div id="wangEditorShow_{{$lang['code']}}">{!!$model->content[$lang['code']] ?? ''!!}</div>
                                    <textarea class="layui-textarea layui-hide" name="content[{{$lang['code']}}]" id="LAY_ditor_{{$lang['code']}}">{!!$model->content[$lang['code']] ?? ''!!}</textarea>
                                    <div class="layui-word-aux st-form-tip"></div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            @else
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('content')}}</label>
                <div class="layui-input-block">
                    <div id="wangEditorShow_">{!!$model->content!!}</div>
                    <textarea class="layui-textarea layui-hide" name="content" id="LAY_ditor_">{!!$model->content!!}</textarea>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            @endif
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('author')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="author" value="{{$model->author}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('status')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="顯示" @if($model->status==1)checked @endif>
                    <input type="radio" name="status" value="2" title="隱藏" @if($model->status==2)checked @endif>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('sort')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="sort" value="{{$model->sort}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('meta_keywords')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="meta_keywords" value="{{$model->meta_keywords}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('meta_description')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="meta_description" value="{{$model->meta_description}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('origin')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="origin" value="{{$model->origin}}" autocomplete="off" placeholder="" class="layui-input">
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
<script type="text/javascript"src="/plugins/wangEditor/wangEditor.min.js"></script>
<script>
$(function () {
    $("[id^='wangEditorShow_']").each(function (index, item) {
        console.log(item);
        var id = $(item).attr('id');
        console.log(id);
        var lang = id.replace('wangEditorShow_', '');
        console.log(lang);
        //富文字編輯
        const E = window.wangEditor;
        const editor = new E('#wangEditorShow_' + lang);
        editor.config.uploadImgHeaders = {"X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')};//自定義header頭
        editor.config.uploadImgServer = '/strongadmin/upload/image/wangeditor'; // 配置 server 介面地址
        editor.config.uploadImgMaxSize = 2 * 1024 * 1024; // 2M 限制上傳大小
        editor.config.uploadFileName = 'file';//上傳檔名
        const $text1 = $('#LAY_ditor_' + lang);
        editor.config.onchange = function (html) {
            // 第二步，監控變化，同步更新到 textarea
            $text1.val(html);
        };
        editor.create();
        // 第一步，初始化 textarea 的值
        $text1.val(editor.txt.html());
    });
});
</script>
<script>
    !function () {
        var form = layui.form, layedit = layui.layedit, laydate = layui.laydate;

        //監聽提交
//    layui.form.on('submit(ST-SUBMIT)', function (data) {
//        var postDatas = data.field;//表單數據
//        //提交json數據
//        var postDatas = JSON.stringify(postDatas);
        //        Util.postForm('#ST-FORM', postDatas, true, 'application/json;charset=utf-8');
//        return false;
//    });
    }();
</script>
@endpush
