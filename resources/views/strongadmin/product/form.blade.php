@extends('strongadmin::layouts.app')

@push('styles')
<style></style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<form class="layui-form" action="@isset($_action){{$_action}}@endisset" id="ST-FORM">
    <input name="id" type="hidden" value="{{$model->id}}" />
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class="layui-this">基礎資訊</li>
            <li>產品分類</li>
            <li>產品價格</li>
            <li>產品詳情</li>
            <li>產品圖片</li>
            <li>產品規格</li>
            <li>相關產品</li>
            <li>相關配件</li>
            <li>SEO設定</li>
        </ul>

        <div class="layui-tab-content">
            <!--基本資訊-->
            <div class="layui-tab-item layui-show">
                <div class="layui-row">
                    <div class="layui-col-xs12">
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
                        @if($_multiLanguageBackend)
                        <div class="layui-form-item st-input-multiLanguage">
                            <label class="layui-form-label">{{$model->getAttributeLabel('intro')}}</label>
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
                                            <textarea name="intro[{{$lang['code']}}]" autocomplete="off" placeholder="" class="layui-textarea" style="min-height: 60px;">{{$model->intro[$lang['code']] ?? ''}}</textarea>
                                        </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                        @else
                        <div class="layui-form-item">
                            <label class="layui-form-label">{{$model->getAttributeLabel('intro')}}</label>
                            <div class="layui-input-block">
                                <textarea name="intro" autocomplete="off" placeholder="" class="layui-textarea" style="min-height: 60px;">{{$model->intro}}</textarea>
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        @endif
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('spu')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="spu" value="{{$model->spu}}" autocomplete="off" placeholder="" class="layui-input" data-tips="商品聚合資訊的最小單位，如 手機->蘋果手機->蘋果6，蘋果6 就是SPU">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('sku')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="sku" value="{{$model->sku}}" autocomplete="off" placeholder="" class="layui-input" data-tips="商品的不可再分的最小單元，如 土豪金 16G 蘋果6">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('brand_id')}}</label>
                            <div class="layui-input-inline">
                                <select name="brand_id">
                                    <option value="0">--</option>
                                    @foreach ($brands as $brand)
                                    <option value="{{$brand->id}}" @if($model->brand_id == $brand->id)selected @endif>{{$brand->title}}</option>
                                    @endforeach
                                </select>
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('stock')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stock" value="{{$model->stock}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('stock_status')}}</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="stock_status" value="1" title="有庫存" @if($model->stock_status==1)checked @endif>
                                <input type="radio" name="stock_status" value="2" title="無庫存" @if($model->stock_status==2)checked @endif>
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">{{$model->getAttributeLabel('is_recommend')}}</label>
                            <div class="layui-input-block">
                                <input type="checkbox" name="is_hot" value="1" title="{{$model->getAttributeLabel('is_hot')}}" lay-skin="primary"  @if($model->is_hot==1)checked @endif>
                                <input type="checkbox" name="is_new" value="1" title="{{$model->getAttributeLabel('is_new')}}" lay-skin="primary"  @if($model->is_new==1)checked @endif>
                                <input type="checkbox" name="is_recommend" value="1" title="{{$model->getAttributeLabel('is_recommend')}}" lay-skin="primary"  @if($model->is_recommend==1)checked @endif>
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('status')}}</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="status" value="1" title="上架" @if($model->status==1)checked @endif>
                                <input type="radio" name="status" value="2" title="下架" @if($model->status==2)checked @endif>
                                <div class="layui-word-aux st-form-tip">」下架「后，該產品無法購買</div>
                            </div>
                            <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('hidden')}}</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="hidden" value="1" title="是" @if($model->hidden==1)checked @endif>
                                <input type="radio" name="hidden" value="2" title="否" @if($model->hidden==2)checked @endif>
                                <div class="layui-word-aux st-form-tip">如果選擇」是「，則該產品不會顯示在產品搜索和分類列表中。但依然可在詳情頁顯示和進行購買</div>
                            </div>
                        </div>
                        
                        <hr>
                        <div class="st-h10"></div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">{{$model->getAttributeLabel('long')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="long" value="{{$model->long}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('width')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="width" value="{{$model->width}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('high')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="high" value="{{$model->high}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">{{$model->getAttributeLabel('weight')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="weight" value="{{$model->weight}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('volume_weight')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="volume_weight" value="{{$model->volume_weight}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">{{$model->getAttributeLabel('click_num')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="click_num" value="{{$model->click_num}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('remark')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="remark" value="{{$model->remark}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--產品分類-->
            <div class="layui-tab-item">
                <div id="ST-TREE"></div>
            </div>
            <!--產品價格-->
            <div class="layui-tab-item">
                <fieldset class="layui-elem-field">
                    <legend>基礎價格</legend>
                    <div class="layui-field-box">
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('sale_price')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="sale_price" value="{{$model->sale_price}}" class="layui-input" onblur="$('#original_price').val((this.value*1.3).toFixed(3));" />
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('original_price')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="original_price" value="{{$model->original_price}}" autocomplete="off" placeholder="" class="layui-input" id="original_price">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="layui-elem-field">
                    <legend>{{$model->getAttributeLabel('wholesale_set')}}</legend>
                    <div class="layui-field-box">
                        <div class="layui-form-item" data-field='wholesale_set'>
                            <div><a class="layui-btn layui-btn-xs st-wholesale-create">新增</a></div>
                            <table class="layui-table st-form-wholesale" lay-size="sm" lay-skin="nob">
                                <colgroup>
                                    <col width="150">
                                    <col width="150">
                                    <col width="100">
                                    <col>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>數量</th>
                                        <th>價格</th>
                                        <th>操作</th>
                                    </tr> 
                                </thead>
                                <tbody>
                                    <tr class="layui-hide">
                                        <td> ≥ <input type="text" name="wholesale_num" class="" /></td>
                                        <td><input type="text" name="wholesale_price" class="" /></td>
                                        <td><a class="layui-btn layui-btn-xs st-wholesale-remove">刪除</a></td>
                                    </tr>
                                    @isset($model->wholesale_set['num'])
                                    @foreach ($model->wholesale_set['num'] as $numVal)
                                    <tr>
                                        <td> ≥ <input type="text" name="wholesale_num" value="{{$numVal}}" /></td>
                                        <td><input type="text" name="wholesale_price"  value="{{$model->wholesale_set['price'][$loop->index]}}" /></td>
                                        <td><a class="layui-btn layui-btn-xs st-wholesale-remove">刪除</a></td>
                                    </tr>
                                    @endforeach
                                    @endisset
                                </tbody>
                            </table>
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                </fieldset>
            </div>
            <!--產品詳情-->
            <div class="layui-tab-item">
                @if($_multiLanguageBackend)
                <div class="st-input-multiLanguage">
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
                                    <div id="wangEditorShow_{{$lang['code']}}">{!!$model->details[$lang['code']] ?? ''!!}</div>
                                    <textarea class="layui-textarea layui-hide" name="details[{{$lang['code']}}]" id="LAY_ditor_{{$lang['code']}}">{!!$model->details[$lang['code']] ?? ''!!}</textarea>
                                    <div class="layui-word-aux st-form-tip"></div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                @else
                <div class="layui-row">
                    <div id="wangEditorShow_">{!!$model->details!!}</div>
                    <textarea class="layui-textarea layui-hide" name="details" id="LAY_ditor_">{!!$model->details!!}</textarea>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
                @endif
            </div>
            <!--產品圖片-->
            <div class="layui-tab-item">
                <div class="layui-row">
                    <div class="layui-upload-drag" id="ST-UPLOAD">
                        <i class="layui-icon"></i>
                        <p>點選上傳產品圖，或將圖片拖拽到此處。( {{config('strongshop.productImage.uploadLimitMimes')}} ≤ {{config('strongshop.productImage.uploadLimitSize')}}kb )</p>
                    </div>
                    <br/>
                    <br/>
                    <div class="layui-col-md6">
                        <ul id="ST-SORTABLE-IMAGE" class="st-sortable-image">
                            <li class="layui-hide">
                                <table>
                                    <tr>
                                        <td>
                                            <img src="" data-title="" />
                                        </td>
                                        <td>
                                            <label>作為封面圖 <input type="radio" name="isImgCover" value="1" lay-ignore /></label>
                                        </td>
                                        <td>
                                            <label>同時作為規格圖 <input type="radio" name="isImgSpec" value="1" lay-ignore /></label>
                                        </td>
                                        <td>
                                            <i class="layui-icon layui-icon-delete"></i>
                                        </td>
                                        <td>
                                            <i class="layui-icon layui-icon-slider"></i> 
                                        </td>
                                    </tr>
                                </table>
                            </li>
                            @if(!empty($model->img_photos))
                            @foreach ($model->img_photos as $img_photo)
                                <li>
                                    <table>
                                    <tr>
                                        <td>
                                            <img src="{{$img_photo['src']}}" data-title="{{$img_photo['title']}}" />
                                        </td>
                                        <td>
                                            <label>作為封面圖 <input type="radio" name="isImgCover" value="1" lay-ignore @if(isset($img_photo['isImgCover']) && $img_photo['isImgCover']) checked @endif /></label>
                                        </td>
                                        <td>
                                            <label>同時作為規格圖 <input type="radio" name="isImgSpec" value="1" lay-ignore @if(isset($img_photo['isImgSpec']) && $img_photo['isImgSpec']) checked @endif /></label>
                                        </td>
                                        <td>
                                            <i class="layui-icon layui-icon-delete"></i>
                                        </td>
                                        <td>
                                            <i class="layui-icon layui-icon-slider"></i> 
                                        </td>
                                    </tr>
                                    </table>
                                </li>
                            @endforeach
                            @endif
                        </ul>
                        <div class="st-h50 layui-clear"></div>
                    </div>
                </div>
            </div>
            <!--產品規格-->
            <div class="layui-tab-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">{{$model->getAttributeLabel('spec_group_id')}}</label>
                    <div class="layui-input-inline">
                        <select name="spec_group_id" lay-filter="specGroup">
                            <option value="">請選擇</option>
                            @foreach ($specGroups as $specGroup)
                            <option value="{{$specGroup->id}}" @if($model->spec_group_id == $specGroup->id)selected @endif>{{$specGroup->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <hr>
                <div id="productSpecsList"></div>
            </div>
            <!--相關產品-->
            <div class="layui-tab-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">{{$model->getAttributeLabel('related_sku')}}</label>
                    <div class="layui-input-block">
                        <input type="text" name="related_sku" value="{{$model->related_sku}}" autocomplete="off" placeholder="請填寫 sku， 多個 sku 請以英文標點 "," 分割" class="layui-input">
                        <div class="layui-word-aux st-form-tip layui-show">請填寫 sku， 多個 sku 請以英文標點 "," 分割</div>
                    </div>
                </div>
            </div>
            <!--相關配件-->
            <div class="layui-tab-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">{{$model->getAttributeLabel('related_accessories_sku')}}</label>
                    <div class="layui-input-block">
                        <input type="text" name="related_accessories_sku" value="{{$model->related_accessories_sku}}" autocomplete="off" placeholder="請填寫 sku， 多個 sku 請以英文標點 "," 分割" class="layui-input">
                        <div class="layui-word-aux st-form-tip layui-show">請填寫 sku， 多個 sku 請以英文標點 "," 分割</div>
                    </div>
                </div>
            </div>
            <!--SEO設定-->
            <div class="layui-tab-item layui-form-pane">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">{{$model->getAttributeLabel('meta_keywords')}}</label>
                    <div class="layui-input-block">
                        <input type="text" name="meta_keywords" value="{{$model->meta_keywords}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">{{$model->getAttributeLabel('meta_description')}}</label>
                    <div class="layui-input-block">
                        <input type="text" name="meta_description" value="{{$model->meta_description}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
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
$(function(){
    $("[id^='wangEditorShow_']").each(function(index,item){
        console.log(item);
        var id = $(item).attr('id');
        console.log(id);
        var lang = id.replace('wangEditorShow_', '');
        console.log(lang);
        //富文字編輯
        const E = window.wangEditor;
        const editor = new E('#wangEditorShow_'+lang);
        editor.config.uploadImgHeaders = {"X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')};//自定義header頭
        editor.config.uploadImgServer = '/strongadmin/upload/image/wangeditor'; // 配置 server 介面地址
        editor.config.uploadImgMaxSize = 2 * 1024 * 1024; // 2M 限制上傳大小
        editor.config.uploadFileName = 'file';//上傳檔名
        const $text1 = $('#LAY_ditor_'+lang);
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
    
    //動態渲染產品規格html部分
    Util.getSpecs('/strongadmin/product/spec/htmlString',$(":input[name='spec_group_id']").val(),{!!$model->id!!});
    //產品規格組選擇事件監聽
    form.on('select(specGroup)', function(data){
      Util.getSpecs('/strongadmin/product/spec/htmlString',data.value,{!!$model->id!!});
    });
        
    //產品圖片上傳&排序
    var sortImageId = '#ST-SORTABLE-IMAGE';
    Util.sortImage(sortImageId);
    layui.upload.render({
        elem: '#ST-UPLOAD'
        , url: '/strongadmin/upload/image?thumb=1' //改成您自己的上傳介面
        , size: 2000 //限制檔案大小，單位 KB
        , multiple: true //多檔案上傳
        , done: function (res) {
            layer.closeAll();
            console.log(res);
            if (res.code != 0) {
                layer.msg(res.message,function(){});
                return;
            }
            layer.msg('上傳成功');
            $(sortImageId + ">li:first").clone(true).appendTo(sortImageId).removeClass('layui-hide').find('img').attr({src: res.data.src, "data-title": res.data.title});
            Util.sortImageCover(sortImageId);
        }
    });
    //產品分類樹
    layui.tree.render({
        elem: '#ST-TREE'
        , data: {!!$categories!!}
        , showCheckbox: true  //是否顯示覆選框
        , id: 'ST-TREE'
        //, isJump: true //是否允許點選節點時彈出新視窗跳轉
        , click: function (obj) {
        //var data = obj.data;  //獲取目前點選的節點數據
        //layer.msg('狀態：' + obj.state + '<br>節點數據：' + JSON.stringify(data));
        }
    });

    //監聽提交
    layui.form.on('submit(ST-SUBMIT)', function (data) {
        var postDatas = data.field;//表單數據
        //console.log(postDatas);
        //重組多語言欄位值
        for(postDataKey in postDatas)
        {
            var resMatch = postDataKey.match(/\[([\w-]+)\]$/);
            if(resMatch){
                console.log(resMatch);
                var newKey = postDataKey.replace(resMatch[0], '');//新欄位（鍵名）
                var newChildKey = resMatch[1];//新欄位的多語言鍵名
                //如果表單欄位有 newKey 欄位
                if(postDatas.hasOwnProperty(newKey)){
                    postDatas[newKey][newChildKey] = postDatas[postDataKey];
                }else{
                    //新欄位的多語言數據
                    var newChildData = {};
                    newChildData[newChildKey] = postDatas[postDataKey];//多語言文字值
                    postDatas[newKey] = newChildData;
                }
            }
        }
        //console.log(postDatas);
        
        //產品分類數據
        var checkedData = layui.tree.getChecked('ST-TREE'); //獲取選中節點的數據[產品分類]
        postDatas.categories = checkedData;
        
        //批發配置
        var wholesale_set = Util.pluckWholesaleSet();
        postDatas.wholesale_set = wholesale_set;
        
        //產品圖片
        var img_photos = Util.pluckImgPhotos();
        postDatas.img_photos = img_photos;//產品相簿
        postDatas.img_cover = $("input[name=isImgCover]:checked").parentsUntil('table').find('img').attr('src');//產品封面圖
        postDatas.img_spec = $("input[name=isImgSpec]:checked").parentsUntil('table').find('img').attr('src');//產品規格圖
        
        //產品規格
        postDatas.productSpecs = Util.pluckSpecs();
        
        //更多配置
        postDatas.more = {
            img_cover_show_inDetail:data.field.img_cover_show_inDetail
        };
        //提交json數據
        var postDatas = JSON.stringify(postDatas);
        Util.postForm('#ST-FORM', postDatas, true, 'application/json;charset=utf-8');
        return false;
    });
    
}();
</script>
@endpush
