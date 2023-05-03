@extends('strongadmin::layouts.app')
@push('styles')
<style>
    td div.layui-table-cell{
    height:80px !important;
    line-height: normal !important;
    overflow: inherit;
    white-space: normal;
    overflow: hidden;
}
</style>
@endpush
@push('scripts')
<script></script>
@endpush
@section('content')
<div class="st-h15"></div>
<form class="layui-form st-form-search" action="" lay-filter="ST-FORM-SEARCH">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">產品分類</label>
            <div class="layui-input-inline">
                <select name="category_id">
                    <option value=""> -- </option>
                    @foreach($categories as $category)
                    <option value="{{$category->id}}">{{$category->name_label}}</option>
                        @foreach($category['children'] as $child)
                        <option value="{{$child->id}}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$child->name_label}}</option>
                        @endforeach
                    @endforeach
                </select>   
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('title')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="title" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
         <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('spu')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="spu" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> 
         <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('sku')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="sku" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> 
         <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('status')}}</label>
            <div class="layui-input-inline">
                <select name="status">
                    <option value="">請選擇</option>
                    <option value="1">上架</option>
                    <option value="2">下架</option>
                </select>   
            </div>
        </div> 
         <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('stock_status')}}</label>
            <div class="layui-input-inline">
                <select name="stock_status">
                    <option value="">請選擇</option>
                    <option value="1">有庫存</option>
                    <option value="2">無庫存</option>
                </select>   
            </div>
        </div> 
<!--         <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('remark')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="remark" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> 
         <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('brand_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="brand_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('created_at')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="created_at_begin" id="date" placeholder="年-月-日" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="text" name="created_at_end" id="date2" placeholder="年-月-日" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-xs st-search-button">開始搜索</a>
        </div>
    </div>
</form>
<table class="layui-hide" id="ST-TABLE-LIST" lay-filter="ST-TABLE-LIST"></table>
<script type="text/html" id="ST-TOOL-BAR">
    <div class="layui-btn-container st-tool-bar">
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/strongadmin/product/create', this.innerText, ['70%', '80%'], true);">新增產品</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/strongadmin/product/destroy">刪除選中</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" href="/product/?id={{d.id}}" target="_blank">檢視</a>
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/strongadmin/product/update?id={{d.id}}', this.innerText, ['70%', '80%'], true);">更新</a>
    <hr/>
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/strongadmin/product/copy?id={{d.id}}', this.innerText, ['70%', '80%'], true);">複製</a>
    <!--<a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/strongadmin/product/destroy?id={{d.id}}');">刪除</a>-->
    @endverbatim
</script>
@endsection
@push('scripts_bottom')        
<script>
!function () {
    //日期
    layui.laydate.render({
        elem: '#date'
    });
    layui.laydate.render({
        elem: '#date2'
    });
    //表格欄位
    var cols = [
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'id', width: 70, fixed: 'left', unresize: true, totalRowText: '合計', sort: true}
                , {field: 'title', title: '{{$model->getAttributeLabel("title")}}',fixed: 'left', width: 260, sort: true, templet: function (res) {
                        var html = '';
                        html += res.title_label;
                        if(res.wholesale_set && res.wholesale_set.num.length>0){
                            html += '<span class="layui-badge layui-bg-gray st-badge-wholesale">批發</span>';
                        }else{
                            
                        }
                        return html;
                    }}
                , {field: 'img_cover', title: '{{$model->getAttributeLabel("img_cover")}}', fixed: 'left',width: 120, templet: function (res) {
                    return  '<img class="st-img-zoom" src="'+res.img_cover+'" />';
                    }}
//                , {field: 'original_price', title: '{{$model->getAttributeLabel("original_price")}}', width: 90, sort: true}
                , {field: 'sale_price', title: '{{$model->getAttributeLabel("sale_price")}}', width: 105, sort: true}
                , {field: 'sku', title: '{{$model->getAttributeLabel("spu")}} / {{$model->getAttributeLabel("sku")}}', width: 150, sort: true, templet: function(res){
                    return 'spu: '+ res.spu + '<hr/>' + 'sku: '+res.sku;
                }}
                , {field: 'status', title: '{{$model->getAttributeLabel("status")}}', width: 90, sort: true, templet: function (res) {
                        var html = res.status==1  ? '<span class="layui-badge layui-bg-green">上架</span>' : '<span class="layui-badge">下架</span>';
                        html += res.hidden ==1 ? '<hr/><span class="layui-badge">強制隱藏</span>': '';
                        return html;
                    }}
                , {field: 'is_hot', title: '{{$model->getAttributeLabel("is_hot")}}', width: 70, sort: true, templet: function (res) {
                    return  res.is_hot==1  ? '<span class="layui-badge layui-bg-green">熱賣</span>' : '/';
                    }}
                , {field: 'is_new', title: '{{$model->getAttributeLabel("is_new")}}', width: 70, sort: true, templet: function (res) {
                    return  res.is_new==1  ? '<span class="layui-badge layui-bg-green">新品</span>' : '/';
                    }}
                , {field: 'is_recommend', title: '{{$model->getAttributeLabel("is_recommend")}}', width: 70, sort: true, templet: function (res) {
                    return  res.is_recommend==1  ? '<span class="layui-badge layui-bg-green">推薦</span>' : '/';
                    }}
                , {field: 'sale_num', title: '{{$model->getAttributeLabel("sale_num")}}', width: 85, sort: true}
                , {field: 'stock', title: '{{$model->getAttributeLabel("stock")}}', width: 70, sort: true}
                , {field: 'stock_status', title: '{{$model->getAttributeLabel("stock_status")}}', width: 95, sort: true, templet: function (res) {
                    return  res.stock_status==1  ? '<span class="layui-badge layui-bg-green">有庫存</span>' : '<span class="layui-badge">無庫存</span>';
                    }}
                , {field: 'click_num', title: '{{$model->getAttributeLabel("click_num")}}', width: 85, sort: true}
//                , {field: 'hidden', title: '{{$model->getAttributeLabel("hidden")}}', width: 100, sort: true, templet: function (res) {
//                    return  res.hidden==1  ? '<span class="layui-badge">是</span>' : '<span class="layui-badge layui-bg-gray">否</span>';
//                    }}
                , {field: 'weight', title: '{{$model->getAttributeLabel("weight")}}', width: 85, sort: true}
//                , {field: 'long', title: '{{$model->getAttributeLabel("long")}}', width: 60, sort: true}
//                , {field: 'width', title: '{{$model->getAttributeLabel("width")}}', width: 60, sort: true}
//                , {field: 'high', title: '{{$model->getAttributeLabel("high")}}', width: 60, sort: true}
//                , {field: 'volume_weight', title: '{{$model->getAttributeLabel("volume_weight")}}', width: 85, sort: true}
                , {field: 'brand_id', title: '{{$model->getAttributeLabel("brand_id")}}', width: 150, sort: true}
                , {field: 'remark', title: '{{$model->getAttributeLabel("remark")}}', width: 150}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
                , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 150}
            ];
    var tableConfig = {
        cols: [cols]
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush