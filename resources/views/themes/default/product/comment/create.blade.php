@extends('layouts.app')
@push('styles')
<link rel="stylesheet" href="{{asset('/plugins/layui/css/layui.css')}}">
<style>
    [v-cloak] {
        display: none;
    }
    .layui-upload-img{
        width:100px;
        display: inline-block;
    }
    li{
        list-style: inherit;
    }
    ol,ul{
        margin-top: 0;
        margin-bottom: 10px;
        padding-left: 18px;;
    }
    .st-work .bi-trash{
        cursor: pointer;
    }
    .st-work i.handle{
        cursor: move;
    }
    .layui-upload-list{
        display: inline-block;
        margin:0;
    }
    .layui-upload-list li{
        display: inline-block;
        width:100px;
        height:100px;
        overflow: hidden;
        position: relative;
        margin-right:10px;
        border:1px solid #eee;
        cursor:move;
    }
    .layui-upload-list li.ui-state-highlight{
        min-width: 100px;
        min-height: 100px;
        background:yellow;
    }
    .layui-upload-list li > i{
        display: none;
        color:red;
        position: absolute;
        top:0;
        right:0px;
        /*background:#fff;*/
        cursor: pointer;
    }
    .layui-upload-list li:hover > i{
        display: inline-block;
    }
    .layui-upload-drag{
        max-width: 170px;
        padding: 10px;
        display: inline-block;
    }
    .st-work-steps-upload .layui-upload-drag{
        max-width: 122px;
    }
    .layui-elem-quote{
        min-height: 124px;
    }
    .st-work h3{
        margin-top: 20px;
        margin-bottom: 10px;
    }
    .st-work-tools li,.st-work-steps li{
        width:80%;
    }
    .st-work-steps ol>li{
        margin-bottom: 35px;
        padding-left: 20px;
        border-left:2px solid #eee;
    }
    .st-work-tools ul>li::marker,.st-work-steps ol>li::marker{
        font-size:20px;
        font-weight: bolder;
    }
    .st-work-text{
        position: relative;
    }
    .st-work-text-btn{
        position: absolute;
        right: -100px;
        top:0;
        width:100px;
    }
    .st-work-text-btn p{
        text-align: center;
        margin-bottom: 6px;
    }
    .st-work-text-btn p i{
        font-size:19px;
        color:#009688;
        cursor: pointer;
    }
    .st-work-tools .st-work-text-btn p{
        line-height: 34px;
    }
</style>
@endpush

@section('content')
@include('layouts.includes.breadcrumb')
<!--主體區域-->
<div class="st-main">
    <div class="container">
        <div class="st-work" id="app2" v-cloak>
            <div class="form-group" v-bind:class="searchInput.errorClass">
                <label>@lang('Product item code') <font style="color:red">*</font></label>
                <input class="form-control" v-model.trim="work.product.sku" @blur="searchProduct" placeholder="@lang('Product item code')" />
                <p class="help-block">${searchInput.errorMessage}</p>
                <div v-show="work.product.title">
                    <h4>${work.product.title}</h4>
                    <img :src="work.product.img_cover" width="150" />
                </div>
            </div>
            <div class="form-group">
                <label>@lang('Star') <font style="color:red">*</font></label>
                <label class="radio-inline">
                    <input type="radio" name="star" value="1" v-model="work.star"> @lang('1 star')
                </label>
                <label class="radio-inline">
                    <input type="radio" name="star" value="2" v-model="work.star"> @lang('2 stars')
                </label>
                <label class="radio-inline">
                    <input type="radio" name="star" value="3" v-model="work.star"> @lang('3 stars')
                </label>
                <label class="radio-inline">
                    <input type="radio" name="star" value="4" v-model="work.star"> @lang('4 stars')
                </label>
                <label class="radio-inline">
                    <input type="radio" name="star" value="5" v-model="work.star"> @lang('5 stars')
                </label>
            </div>
            <div class="form-group">
                <label>@lang('Content') <font style="color:red">*</font></label>
                <textarea class="form-control" v-model.trim="work.content" rows="3" placeholder="@lang('Say something ... The content must be at least 10 characters.')"></textarea>
            </div>
            <div>
                <div class="st-h20"></div>
                <button class="btn btn-warning" type="submit" name="submit_name" @click="submitWork">@lang('Submit')</button>
            </div>
        </div>
    </div>
</div>

<div class="st-h100"></div>
@endsection
@push('scripts_bottom')
<script src="{{asset('/plugins/layui/layui.js')}}"></script>
<script src="{{asset('/plugins/jquery/jquery-ui-1.12.1/jquery-ui.min.js')}}"></script>
<script src="{{ asset('plugins/vue/vue.min.js') }}"></script>
<script>
new Vue({
    el: '#app2',
    delimiters: ['${', '}'],
    data: {
        message: 'Hello Vue.js!',
        //產品資訊
        work: {
            //關聯的產品資訊
            productData: {
                id: "",
                sku: "",
                title: "",
                img_cover: ""
            }
            , product: {}//產品關聯的產品
            , content: ""//產品描述內容
            , star:5
        },
        //關聯產品搜索
        searchInput: {
            errorClass: '',
            errorMessage: ""
        },
        //排序數據
        sortDatas: {
            start: null //更新前的位置
        }
    },
    methods: {
        /**
         * 搜索產品
         * @returns {undefined}
         */
        searchProduct() {
            var _this = this;
            _this.searchInput.errorClass = '';
            _this.searchInput.errorMessage = '';
            var sku = this.work.product.sku;
            if (!sku) {
                this.work.product = JSON.parse(JSON.stringify(this.work.productData));
                return;
            }
            $.get('/comment/search/product', {sku: sku}, function (res) {
                if (res.data.data.length <= 0) {
                    _this.work.product = JSON.parse(JSON.stringify(_this.work.productData));
                    _this.searchInput.errorClass = 'has-error';
                    _this.searchInput.errorMessage = 'The product(Item code #:' + sku + ') does not exist.';
                    return;
                }
                _this.work.product.id = res.data.data[0].id;
                _this.work.product.title = res.data.data[0].title;
                _this.work.product.img_cover = res.data.data[0].img_cover;
                _this.searchInput.errorClass = 'has-success';
                _this.searchInput.errorMessage = '';
            });
        },
        /**
         * 提交產品
         * @returns {undefined}
         */
        submitWork() {
            //console.log('this.work.pictures', this.work.pictures);
            var _this = this;
            var data = {};
            data.at_user_id = null;
            data.product_id = this.work.product.id;
            data.content = this.work.content;
            data.star = this.work.star;
            $.ajax({
                url: '/comment/create',
                type: 'post',
                dataType: 'json',
                data: JSON.stringify(data),
                contentType: 'application/json;charset=UTF-8',
                success: function (res, status, xhr) {
                    console.log(res);
                    if (res.code !== 200) {
                        Util.showErrors(res.message);
                        return;
                    }
                    _this.work.content = '';
                    _this.work.pictures = [];
                    Util.showSuccess(res.message, false, 5000);
                    return;
                }
            });
        },
        /**
         * 產品圖片拖拽排序
         * @param {type} id 容器
         * @returns {undefined}
         */
        sortable(id) {
            var _this = this;
            var options = {
                placeholder: "ui-state-highlight"//拖拽后佔位
                , opacity: 0.8//透明度
                        //start這個動作在所有動作之前(我觀察到的所有動作之前)
                , start: function (event, ui) {
                    var ind = ui.item.index();
                    console.log('start ui.item.index()', ind);
                    _this.sortDatas.start = ind;
                }
                //位置改變了才會啟用  介於receive和deactivate之間
                , update: function (event, ui) {
                    var updatedInd = ui.item.index();
                    var arr = _this.work.pictures;
                    console.log('update ui.item.index()', updatedInd);
                    console.log('sortDatas', _this.sortDatas);
                    console.log('排序前 _this.work.pictures', arr);
                    var index1 = updatedInd;//更新后的位置
                    var index2 = _this.sortDatas.start;//更新前的位置
                    var arrNew = _this.swapArray(arr, index1, index2);
                    console.log('排序后 _this.work.pictures', arrNew);
                    _this.work.pictures = [];
                    setTimeout(function () {
                        _this.work.pictures = arrNew;
                        console.log('排序后--setTimeout _this.work.pictures', _this.work.pictures);
                    }, 10);
                }
            };
            $(id).sortable(options);
            $(id).disableSelection();
        },
        /**
         * 陣列元素交換位置
         * @param {type} arr
         * @param {type} index1
         * @param {type} index2
         * @returns {unresolved}
         */
        swapArray(arr, index1, index2) {
            arr = JSON.parse(JSON.stringify(arr));
            arr[index1] = arr.splice(index2, 1, arr[index1])[0];
            return arr;
        },
        /**
         * 排序 上移
         * @param {type} arr
         * @param {type} index
         * @param {type} length
         * @returns {undefined}
         */
        zIndexUp(arr, index) {
            if (index > 0) {
                return this.swapArray(arr, index, index - 1);
            } else {
                console.log('已經處於置頂，無法上移');
            }
            return arr;
        },
        /**
         * 排序 下移
         * @param {type} arr
         * @param {type} index
         * @param {type} length
         * @returns {undefined}
         */
        zIndexDown(arr, index) {
            if ((index + 1) < arr.length) {
                return this.swapArray(arr, index, index + 1);
            } else {
                console.log('已經處於置底，無法下移');
            }
            return arr;
        }
    },
    created: function () {
        //關聯的產品sku
        var sku = '{{request("sku")}}';
        //作品關聯的產品
        this.work.product = JSON.parse(JSON.stringify(this.work.productData));
        if (sku) {
            this.work.product.sku = sku;
            this.searchProduct();
        }
    },
    mounted: function () {
    }
});
</script>
@endpush