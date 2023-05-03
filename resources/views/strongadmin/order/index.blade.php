@extends('strongadmin::layouts.app')
@push('styles')
<style>
    td div.layui-table-cell{
        height:86px !important;
        /*line-height: normal !important;*/
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
                <input type="text" name="user_id" autocomplete="off" placeholder="email" class="layui-input">
            </div>
        </div><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('order_no')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="order_no" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('order_status')}}</label>
            <div class="layui-input-inline">
                <select name="order_status">
                    <option value="">--</option>
                    @foreach($order_status as $status_key=>$status_val)
                    <option value="{{$status_key}}" @if(request('order_status')==$status_key) selected="" @endif >{{$status_val['name']}}</option>
                    @endforeach
                </select>  
            </div>
        </div> 
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('shipping_option_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="shipping_option_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('payment_option_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="payment_option_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('transaction_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="transaction_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('remark')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="remark" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('first_name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="first_name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('last_name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="last_name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('email')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="email" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('phone')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" autocomplete="off" placeholder="" class="layui-input">
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
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/strongadmin/order/create', this.innerText);">新增</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/strongadmin/order/destroy">刪除選中</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchPrint" data-href="/strongadmin/order/print">批量列印</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createWindow('/strongadmin/order/show?id={{d.id}}', this.innerText);">檢視</a>
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/strongadmin/order/update?id={{d.id}}', this.innerText, ['65%', '75%']);">更新</a>
    <hr />
    <a class="layui-btn layui-btn-xs" href="/strongadmin/order/print?id={{d.id}}" target="_blank">列印</a>
    <a class="layui-btn layui-btn-xs" lay-event="more">更多 <i class="layui-icon layui-icon-down"></i></a>
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
                , {field: 'id', title: 'id', width: 60, fixed: 'left', unresize: true, totalRowText: '合計', sort: true}
                , {field: 'order_no', title: '{{$model->getAttributeLabel("order_no")}}', width: 180, fixed: 'left', sort: true, templet: function (res) {
                        var html = res.order_no + '<br/><br/>';
                        html += '<span class="layui-badge '+res.order_status_style+'">'+res.order_status_label+'</span>'
                        return html;
                }}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 210,fixed: 'left', sort: true, templet: function (res) {
                        var html = res.buyer.email;
                        html += '<br/><br/>' + res.created_at;
                        return  html;
                }}
                , {field: 'country', title: '收貨資訊', width: 310, templet: function (res) {
                        var html = '';
                        html += res.first_name + ' ' + res.last_name;
                        html += ' [' + res.country + ']';
                        html += '<hr/>';
                        html += res.address_line_1;
                        return  html;
                }}
                , {field: 'weight_total', title: '{{$model->getAttributeLabel("weight_total")}}', width: 100, sort: true, templet: function (res) {
                    return (res.weight_total/1000) + '千克';
                }}
                , {field: 'currency_code', title: '{{$model->getAttributeLabel("currency_code")}}', width: 120, sort: true, templet: function (res) {
                    return res.currency_code + '<hr/>' + 'Rate：' + res.currency_rate;
                }}
                , {field: 'order_amount', title: '{{$model->getAttributeLabel("order_amount")}}', width: 120, sort: true, templet: function (res) {
                        var defaultCurrencyBackend = '{{config("strongshop.defaultCurrencyBackend")}}';
                        var html = res.currency_code + ' ' + res.order_amount;
                        if(defaultCurrencyBackend === res.currency_code){
                            return html;
                        }
                        html += '<hr/>';
                        html += defaultCurrencyBackend + ' ' + (res.order_amount / res.currency_rate).toFixed({{config("strongshop.defaultDedimal")}});
                        return html;
                }}
                , {field: 'paid_amount', title: '{{$model->getAttributeLabel("paid_amount")}}', width: 120, sort: true}
//                , {field: 'products_amount', title: '{{$model->getAttributeLabel("products_amount")}}', width: 120, sort: true, templet: function (res) {
//                        var defaultCurrencyBackend = '{{config("strongshop.defaultCurrencyBackend")}}';
//                        var html = res.currency_code + ' ' + res.products_amount;
//                        if(defaultCurrencyBackend === res.currency_code){
//                            return html;
//                        }
//                        html += '<hr/>';
//                        html += defaultCurrencyBackend + ' ' + (res.products_amount / res.currency_rate).toFixed({{config("strongshop.defaultDedimal")}});
//                        return html;
//                }}
                , {field: 'source', title: '{{$model->getAttributeLabel("source")}}', width: 150, sort: true, templet:function(res){
                        var html = '';
                        if(res.source){
                            html += res.source;
                        }
                        if(res.http_referer){
                            html += '<hr/>'+res.http_referer;
                        }
                        return html;
                }}
                , {field: 'pay_remark', title: '{{$model->getAttributeLabel("pay_remark")}}', width: 150, sort: true}
                , {field: 'shipping_option_id', title: '{{$model->getAttributeLabel("shipping_option_id")}}', width: 150, sort: true, templet: function (res) {
                        return res.shipping_option.title +'<br/>' + '跟蹤單號：' + res.tracking_no;
                }}
                , {field: 'payment_option_id', title: '{{$model->getAttributeLabel("payment_option_id")}}', width: 150, sort: true, templet: function (res) {
                        return res.payment_option.title + '<br/>' + '交易單號：' + res.transaction_id;
                }}
                , {field: 'remark', title: '{{$model->getAttributeLabel("remark")}}', width: 150, sort: true}
                , {field: 'shipped_at', title: '{{$model->getAttributeLabel("shipped_at")}}', width: 150, sort: true}
                , {field: 'received_at', title: '{{$model->getAttributeLabel("received_at")}}', width: 150, sort: true}
                , {field: 'canceled_at', title: '{{$model->getAttributeLabel("canceled_at")}}', width: 150, sort: true}
                , {field: 'returned_at', title: '{{$model->getAttributeLabel("returned_at")}}', width: 150, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 150}
            ];
    var order_status = "{{request('order_status')}}";
    var tableConfig = {
        cols: [cols]
        ,where:{order_status:order_status}
    };
    var tableIns = Util.renderTable(tableConfig);
    
    var tableId = tableIns.config.id;
    //工具欄事件
    layui.table.on('toolbar(' + tableId + ')', function (obj) {
        var checkStatus = layui.table.checkStatus(obj.config.id);
        switch (obj.event) {
            case 'batchDelete':
                Util.batchDelete($(this).attr('data-href'), checkStatus.data);
                break;
            case 'ST-EXPORT-EXCEL':
                var data = layui.form.val(Util.tableConfigDefault.searchFormId);
                Util.exportFile(tableIns, data);
                break;
            case 'batchPrint':
                var arr = $.map(checkStatus.data, function (n, i) {
                    return n['id'];
                });
                var idStr = arr.join('|');
                window.open('/strongadmin/order/print?id='+idStr);
                break;
        }
        return;
    });
    
    //行工具事件
  layui.table.on('tool(ST-TABLE-LIST)', function(obj){
    var that = this,d = obj.data;
    console.log(d)
    if(obj.event === 'more'){
        //更多下拉菜單
        var dataOp = [];
        if(d.order_status === 10 || d.order_status === 13 || d.order_status === 14){
            dataOp = dataOp.concat([
                {title: '確認已付款',id: 'paid'}
                ,{title: '關閉訂單',id: 'close'}

            ]);
        }else if(d.order_status === 12){
            dataOp = dataOp.concat([
                {title: '確認發貨',id: 'shipped'}
            ]);
        }else if(d.order_status === 20){
            dataOp = dataOp.concat([
                {title: '確認退貨',id: 'returned'}
                ,{title: '確認完成',id: 'done'}
            ]);
        }else if(d.order_status === 42){
            dataOp = dataOp.concat([
                {title: '刪除',id: 'del'}
            ]);
        }
      layui.dropdown.render({
        elem: that
        ,show: true //外部事件觸發即顯示
        ,data: dataOp
        ,click: function(data, othis){
            if(data.id === 'shipped'){
                Util.createFormWindow('/strongadmin/order/confirm/shipped?id='+d.id, '確認發貨');
                return;
            }
            layer.confirm('確定'+data.title+'?', function(index){
                //根據 id 做出不同操作
                if(data.id === 'del'){
                    $.post('/strongadmin/order/destroy', {id:d.id}).then(response => {
                        if (response.code === 200) {
                            layer.close(index);
                            layer.msg(response.message, {time: 1500},function(){
                                obj.del();
                            });
                        }else{
                            layer.msg(response.message, {anim: 6});
                        }
                    });
                } else if(data.id === 'close'){
                    $.post('/strongadmin/order/confirm/close', {id:d.id}).then(response => {
                        console.log(obj);
                        if (response.code === 200) {
                            layer.close(index);
                            layer.msg(response.message, {time: 1500});
                            //過載重新整理
                            tableIns.reload();
                        }else{
                            layer.msg(response.message, {anim: 6});
                        }
                    });
                } else if(data.id === 'paid'){
                    $.post('/strongadmin/order/confirm/paid', {id:d.id}).then(response => {
                        if (response.code === 200) {
                            layer.close(index);
                            layer.msg(response.message, {time: 1500});
                            //過載重新整理
                            tableIns.reload();
                        }else{
                            layer.msg(response.message, {anim: 6});
                        }
                    });
                } else if(data.id === 'shipped'){
                    Util.createFormWindow('/strongadmin/order/confirm/shipped?id='+d.id, '確認發貨');
                } else if(data.id === 'returned'){
                    $.post('/strongadmin/order/confirm/returned', {id:d.id}).then(response => {
                        if (response.code === 200) {
                            layer.close(index);
                            layer.msg(response.message, {time: 1500});
                            //過載重新整理
                            tableIns.reload();
                        }else{
                            layer.msg(response.message, {anim: 6});
                        }
                    });
                } else if(data.id === 'done'){
                    $.post('/strongadmin/order/confirm/done', {id:d.id}).then(response => {
                        if (response.code === 200) {
                            layer.close(index);
                            layer.msg(response.message, {time: 1500});
                            //過載重新整理
                            tableIns.reload();
                        }else{
                            layer.msg(response.message, {anim: 6});
                        }
                    });
                }
            });
        }
        ,style: 'margin-left: -45px; box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' //設定額外樣式
      }); 
    }
  });
}();
</script>
@endpush