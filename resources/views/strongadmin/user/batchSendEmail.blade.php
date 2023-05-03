@extends('strongadmin::layouts.app')
@push('styles')
<style></style>
@endpush
@push('scripts')
<script></script>
@endpush
@section('content')
<div class="st-h15"></div>
<form class="layui-form st-form-search" lay-filter="ST-FORM-SEARCH">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('country_code')}}</label>
            <div class="layui-input-inline">
                <select name="country_code">
                    <option value="">--</option>
                    @foreach($countries as $country_code=>$country_name)
                    <option value="{{$country_code}}">{{$country_name}}</option>
                    @endforeach
                </select>   
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('email')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="email" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('status')}}</label>
            <div class="layui-input-inline">
                <select name="status">
                    <option value="">--</option>
                    <option value="1" selected="">正常</option>
                    <option value="2">禁用</option>
                </select>   
            </div>
        </div> 
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('gender')}}</label>
            <div class="layui-input-inline">
                <select name="gender">
                    <option value="">--</option>
                    <option value="0">保密</option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>
            </div>
        </div> 
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('rank_credits')}}</label>
            <div class="layui-input-inline">
                <input type="number" min="0" name="rank_credits_begin" autocomplete="off" placeholder="min" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="number" min="0" name="rank_credits_end" autocomplete="off" placeholder="max" class="layui-input">
            </div>
        </div> 
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
            <label class="layui-form-label">訂單為零</label>
            <div class="layui-input-inline">
                <input type="text" name="no_order_at_begin" id="date3" placeholder="年-月-日" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="text" name="no_order_at_end" id="date4" placeholder="年-月-日" autocomplete="off" class="layui-input">
            </div>
        </div> 
        <div class="layui-inline">
            <a class="layui-btn layui-btn-xs st-search-button">開始搜索</a>
        </div>
    </div>
</form>
<table class="layui-hide" id="ST-TABLE-LIST" lay-filter="ST-TABLE-LIST"></table>

<div class="st-h15"></div>
<form class="layui-form" id="ST-FORM" action="">
    <div class="layui-row">
        <div class="layui-form-item">
            <label class="layui-form-label">郵件標題</label>
            <div class="layui-input-block">
                <input type="text" name="title" value="" autocomplete="off" placeholder="" class="layui-input" >
                <div class="layui-word-aux st-form-tip"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">郵件內容</label>
            <div class="layui-input-block">
                <textarea  name="content"  autocomplete="off" placeholder="" class="layui-textarea layui-hide" id="LAY_ditor" lay-verify="details"></textarea>
                <div class="layui-word-aux st-form-tip"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">發送時間</label>
            <div class="layui-input-block">
                <input type="text" name="sendtime" id="sendtime" placeholder="年-月-日" autocomplete="off" class="layui-input">
                <div class="layui-word-aux st-form-tip"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>備註</label>
            <div class="layui-input-block">
                <input type="text" name="remark" autocomplete="off" class="layui-input">
                <div class="layui-word-aux st-form-tip">僅作為發送記錄備註，和發送郵件內容無關。</div>
            </div>
        </div>
        <div class="layui-form-item st-form-submit-btn">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="ST-SUBMIT">確認提交 (目前搜索條件下全部會員)</button>
                <a class="layui-btn" href="/strongadmin/user/userPushNotification/index">檢視歷史記錄</a>
            </div>
        </div>
    </div>
</form>
<div class="st-h100"></div>
@endsection
@push('scripts_bottom')        
<script>
    !function () {
        //建立一個編輯器
        var editIndex = layui.layedit.build('LAY_ditor', {
            uploadImage: {url: '/strongadmin/upload/image', type: 'post'},
            tool: ['strong', , 'italic', 'underline', 'del', '|', 'left', 'center', 'right', '|', 'link', 'unlink', '|', 'image']
        });
        //自定義驗證規則
        layui.form.verify({
            details: function (value) {
                layui.layedit.sync(editIndex);
            }
        });
        //日期
        layui.laydate.render({
            elem: '#date'
        });
        layui.laydate.render({
            elem: '#date2'
        });
        layui.laydate.render({
            elem: '#date3'
        });
        layui.laydate.render({
            elem: '#date4'
        });
        layui.laydate.render({
            elem: '#sendtime',
            type: 'datetime'
        });
        //表格欄位
        var cols = [
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', title: 'id', width: 60, fixed: 'left', unresize: true, totalRowText: '合計', sort: true}
            , {field: 'email', title: '{{$model->getAttributeLabel("email")}}', width: 300, sort: true, templet: function (res) {
                    var html = '';
                    if (res.email_verified_at) {
                        html += '<span class="layui-badge layui-bg-green">已驗證</span>';
                    } else {
                        html += '<span class="layui-badge layui-bg-orange">未驗證</span>';
                    }
                    html += ' ' + res.email;
                    return html;
                }}
            , {field: 'country', title: '{{$model->getAttributeLabel("country_code")}}', width: 150, sort: true}
            , {field: 'first_name', title: '{{$model->getAttributeLabel("first_name")}}', width: 150, sort: true}
            , {field: 'last_name', title: '{{$model->getAttributeLabel("last_name")}}', width: 150, sort: true}
            , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
            , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
            , {field: 'status', title: '{{$model->getAttributeLabel("status")}}', width: 80, templet: function (res) {
                    return  res.status == 1 ? '<span class="layui-badge layui-bg-green">正常</span>' : '<span class="layui-badge">禁用</span>';
                }}
            , {field: 'pay_credits', title: '{{$model->getAttributeLabel("pay_credits")}}', width: 150, sort: true}
            , {field: 'rank_credits', title: '{{$model->getAttributeLabel("rank_credits")}}', width: 150, sort: true}
            , {field: 'last_login_at', title: '{{$model->getAttributeLabel("last_login_at")}}', width: 150, sort: true}
            , {field: 'last_login_ip', title: '{{$model->getAttributeLabel("last_login_ip")}}', width: 150, sort: true}
            , {field: 'avatar', title: '{{$model->getAttributeLabel("avatar")}}', width: 150, sort: true, templet: function (res) {
                    if (res.avatar) {
                        return  '<img class="st-img-zoom" src="' + res.avatar + '" />';
                    }
                    return '/';
                }}
            , {field: 'nickname', title: '{{$model->getAttributeLabel("nickname")}}', width: 150, sort: true}
            , {field: 'user_name', title: '{{$model->getAttributeLabel("user_name")}}', width: 150, sort: true}
            , {field: 'mobile', title: '{{$model->getAttributeLabel("mobile")}}', width: 150, sort: true}
            , {field: 'mobile_verified_at', title: '{{$model->getAttributeLabel("mobile_verified_at")}}', width: 150, sort: true, templet: function (res) {
                    if (res.mobile_verified_at) {
                        return  res.mobile_verified_at;
                    }
                    return '<span class="layui-badge layui-bg-orange">未驗證</span>';
                }}
            , {field: 'gender', title: '{{$model->getAttributeLabel("gender")}}', width: 150, sort: true, templet: function (res) {
                    return res.gender == 0 ? '保密' : (res.gender == 1 ? '男' : '女');
                }}
            , {field: 'birthday', title: '{{$model->getAttributeLabel("birthday")}}', width: 150, sort: true}
            //, {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 150}
        ];
        var tableConfig = {
            cols: [cols]
            , method: 'post'
            , toolbar: false //工具欄
            , height: 'full-500'//高度最大適應化
        };
        //表格渲染
        Util.renderTable(tableConfig);
        //監聽提交
        layui.form.on('submit(ST-SUBMIT)', function (data) {
            var searchData = layui.form.val("ST-FORM-SEARCH");
            searchData.batchSendMail = data.field;
            //提交json數據
            var postDatas = JSON.stringify(searchData);
            Util.postForm('#ST-FORM', postDatas, false, 'application/json;charset=utf-8');
            //layer.alert(JSON.stringify(data.field), {
            //    title: '最終的提交資訊'
            //});
            return false;
        });
    }();
</script>
@endpush