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
<form class="layui-form st-form-search" lay-filter="ST-FORM-SEARCH">
    <div class="layui-form-item"><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('user_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="user_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('first_name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="first_name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('last_name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="last_name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('country')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="country" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('at_user_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="at_user_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('product_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="product_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('product_sku')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="product_sku" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('status')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="status" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('credits')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="credits" autocomplete="off" placeholder="" class="layui-input">
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
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/strongadmin/product/comment/create', this.innerText);">新增</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/strongadmin/product/comment/destroy">刪除選中</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <!--<a class="layui-btn layui-btn-xs" href="/comment/show?id={{d.id}}&backend=abc" target="_blank">檢視</a>-->
    <!--<a class="layui-btn layui-btn-xs" onclick="Util.createWindow('/admin/product/comment/show?id={{d.id}}', this.innerText);">檢視</a>-->
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/strongadmin/product/comment/update?id={{d.id}}', this.innerText);">更新</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/strongadmin/product/comment/destroy?id={{d.id}}');">刪除</a>
    <hr/>
    {{#if (d.status==2 || d.status==3){ }}
    <a class="layui-btn layui-btn-xs" onclick="st_approve('/strongadmin/product/comment/approve?id={{d.id}}');">審覈通過</a>
    {{# } }}
    {{#if (d.status==2){ }}
    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="st_refused('/strongadmin/product/comment/refused?id={{d.id}}');">審覈拒絕</a>
    {{# } }}
    @endverbatim
</script>
@endsection
@push('scripts_bottom')        
<script>
    function st_approve(url)
    {
        $.post(url).then(response => {
            console.log(response);
            if (response.code === 200) {
                layer.msg(response.message, {
                    time: 1500
                });
                layui.table.reload("ST-TABLE-LIST");
                return;
            }
            layer.msg(response.message, {
                //offset: 'b',
                anim: 6
            });
            return false;
        })
                .catch(function (error) {
                    console.log(error);
                });
    }
    function st_refused(url)
    {
        $.post(url).then(response => {
            console.log(response);
            if (response.code === 200) {
                layer.msg(response.message, {
                    time: 1500
                });
                layui.table.reload("ST-TABLE-LIST");
                return;
            }
            layer.msg(response.message, {
                //offset: 'b',
                anim: 6
            });
            return false;
        })
                .catch(function (error) {
                    console.log(error);
                });
    }
    
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
                , {field: 'id', title: 'id', width: 60, fixed: 'left', unresize: true, totalRowText: '合計', sort: true}
//                , {field: 'email', title: '{{$model->getAttributeLabel("email")}}', width: 150, sort: false, templet: function (res) {
//                        return res.user.email;
//                    }}
                , {field: 'first_name', title: '{{$model->getAttributeLabel("first_name")}}', width: 150, sort: true}
                , {field: 'last_name', title: '{{$model->getAttributeLabel("last_name")}}', width: 150, sort: true}
                , {field: 'country', title: '{{$model->getAttributeLabel("country")}}', width: 150, sort: true}
                , {field: 'product_sku', title: '{{$model->getAttributeLabel("product_sku")}}', width: 150, sort: true}
                , {field: 'content', title: '{{$model->getAttributeLabel("content")}}', width: 350, sort: true}
                , {field: 'star', title: '{{$model->getAttributeLabel("star")}}', width: 90, sort: true}
                , {field: 'status', title: '{{$model->getAttributeLabel("status")}}', width: 90, sort: true, templet: function (res) {
                        if(res.status==1){
                            var html = '<span class="layui-badge layui-bg-green">審覈通過</span>';
                        }else if(res.status ==2){
                            var html = '<span class="layui-badge layui-bg-orange">待審覈</span>';
                        }else{
                            var html = '<span class="layui-badge">審覈拒絕</span>';
                        }
                        return html;
                    }}
//                , {field: 'credits', title: '{{$model->getAttributeLabel("credits")}}', width: 150, sort: true}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
                , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 180}
            ];
    var tableConfig = {
        cols: [cols]
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush