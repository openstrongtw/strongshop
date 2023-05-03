@extends('strongadmin::layouts.app')
@push('styles')
<style></style>
@endpush
@push('scripts')
<script></script>
@endpush
@section('content')
<div class="st-h15"></div>
<form class="layui-form layui-form-pane" action="">
    <input name="id" type="hidden" value="{{$model->id}}" />
    <input name="level" type="hidden" value="{{$model->level}}" />
    <input name="parent_id" type="hidden" value="{{$model->parent_id}}" />
    <div class="layui-row">
        <div class="layui-col-xs11">
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('parent_id')}}</label>
                <div class="layui-input-block">
                    @if($model->id && ($model->level==2 || $model->level==3))
                    <select name="parent_id" disabled="">
                        <option value="">請選擇</option>
                        @foreach ($menus as $menu)
                        <option value="{{$menu->id}}" @if($menu->id==$model->parent_id) selected @endif >{{$menu->name_label}}</option>
                        @endforeach
                    </select>
                    @else
                    <input type="text" name="parent_name" value="{{request('parent_name')}}" autocomplete="off" placeholder="" class="layui-input" readonly>
                    @endif
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
                </div>
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
                <label class="layui-form-label">{{$model->getAttributeLabel('sort')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="sort" value="{{$model->sort}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('status')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="開啟" @if($model->status==1)checked @endif>
                    <input type="radio" name="status" value="2" title="禁用" @if($model->status==2)checked @endif>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">{{$model->getAttributeLabel('meta_keywords')}}</label>
                <div class="layui-input-block">
                    <textarea name="meta_keywords" autocomplete="off" placeholder="" class="layui-textarea"></textarea>
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">{{$model->getAttributeLabel('meta_description')}}</label>
                <div class="layui-input-block">
                    <textarea name="meta_description" autocomplete="off" placeholder="" class="layui-textarea"></textarea>
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
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
