@extends('layouts.app')

@push('styles')
<link rel="stylesheet" href="{{ asset('vendor/swiper/swiper-bundle.min.css') }}">
@endpush

@section('content')
@include('layouts.includes.breadcrumb')
<!--主體區域-->
<div class="st-main" id="ST-PRODUCT-SHOW">
    @include('layouts.includes.productShow')
</div>
@endsection
@push('scripts_bottom')
<script src="{{ asset('vendor/swiper/swiper-bundle.min.js') }}"></script>
<script>
!function () {
    var showToggleProductAjax = '{{config('strongshop.showToggleProductAjax')}}';
    //產品放大鏡,移動端產品輪播
    renderProductPictures();
    
    /**
     * 規格提示
     * bootstrap3 - JavaScript 外掛 - 工具提示 https://v3.bootcss.com/javascript/#tooltips
     */
    $('[data-toggle="tooltip"]').tooltip();
    
    //目前產品規格
    var specs = @json($price_sepcs);
    console.log('specs', specs);
    //獲取目前產品規格值
    var currSpecs = [];
    for (x in specs)
    {
        currSpecs[x] = specs[x].pivot.spec_value;
    }
    currSpecs.sort();
    console.log('currSpecs', currSpecs);
    //spu產品規格
    var spuSpecs = @json($row->spu_specs);
    console.log('spu_specs', spuSpecs);
    //獲取spu產品規格值
    var spuSpecsValues=[];
    for(x in spuSpecs){
        spuSpecsValues[x] = spuSpecs[x].spec_values.sort().toString();
    }
    console.log('spu_specs_values', spuSpecsValues);
    //如果目前產品規格大於等於2個 則 標記出全部的無效規格
    if(currSpecs.length >=2){
        markInvalidSpecAll(currSpecs);
    }
    //產品規格點選選擇事件
    $(document).on('click', ".st-detail-attr > dl.st-attr > dd", function () {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            $(this).parent().removeClass('active');
            $(this).parent().parent().find("dl>dd").removeClass('st-invalid');
        } else {
            $(this).addClass('active').siblings('dd').removeClass('active');
            $(this).parent().addClass('active');
        }
        //獲取已選規格
        var selectedSpecs = [],n=0;
        $(this).parent().parent().children("dl.st-attr").each(function () {
            var childActiveObj = $(this).children('dd.active');
            if(typeof(childActiveObj.attr('data-spec')) != "undefined"){
                selectedSpecs[n] = childActiveObj.attr('data-spec');
                n++;
                $(this).addClass('active');
            }else{
                $(this).removeClass('active');
            }
        });
        console.log('selectedSpecs', selectedSpecs);
        //如果還剩一種規格組未選 則 標記出該規格組無效的規格
        if((currSpecs.length-selectedSpecs.length) === 1){
            var markSpec = $(this).parent().parent().children("dl.st-attr:not(.active)").children('dd');
            markInvalidSpec(markSpec, selectedSpecs);
        }
        //如果規格還未全部選完
        if(selectedSpecs.length !== currSpecs.length){
            console.log('selectedSpecs.length !== currSpecs.length', selectedSpecs.length, currSpecs.length);
            return;
        }
        selectedSpecs.sort();
        console.log('selectedSpecs', selectedSpecs.length, selectedSpecs.toString());
        //如果所選規格和目前規格相同
        if (currSpecs.toString() === selectedSpecs.toString()) {
            console.log('所選規格和目前規格相同', currSpecs.toString(), selectedSpecs.toString());
            return;
        }
        //匹配所選規格
        for (x in spuSpecs)
        {
            if (selectedSpecs.toString() === spuSpecs[x].spec_values.sort().toString()) {
                //如果匹配到則重定向到該產品詳情
                var url ='/product?id=' + spuSpecs[x].product_id;
                console.log('匹配到：',url);
                if(!showToggleProductAjax){
                    window.location.href = url;
                    return;
                }
                currSpecs = selectedSpecs;
                url += '&fetchHtml=1';
                layer.load(1);
                $.get(url, function(res){
                    layer.closeAll();
                    $("#ST-PRODUCT-SHOW").html(res.data.content);
                    if(currSpecs.length >=2){
                        markInvalidSpecAll(currSpecs);
                    }
                    renderProductPictures();
                });
                return;
            }
        }
        $(this).removeClass('active').addClass('st-invalid');
    });
    
    /**
     * 標記無效的規格
     * @param {type} obj 需要遍歷匹配的規格對像
     * @param selectedSpecs 已選的規格陣列
     */
    function markInvalidSpec(obj, selectedSpecs)
    {
        $(obj).each(function (i) {
            var dataSpecVal = $(this).attr('data-spec');
            selectedSpecs.push(dataSpecVal);
            selectedSpecs.sort();
            //匹配無效規格
            if(spuSpecsValues.includes(selectedSpecs.toString())){
                $(this).removeClass('st-invalid');
                console.log('Matching the spec:',dataSpecVal, selectedSpecs, 'valid 有效');
            }else{
                $(this).addClass('st-invalid');
                console.log('Matching the spec:',dataSpecVal, selectedSpecs, 'invalid 無效');
            }
            var indSpec = selectedSpecs.indexOf(dataSpecVal);
            selectedSpecs.splice(indSpec,1);
        });
    }
    /**
     * 標記出全部的無效規格
     */
    function markInvalidSpecAll(currSpecs)
    {
        for(var z=0; z < currSpecs.length; z++){
            var selectedSpecs = JSON.parse(JSON.stringify(currSpecs));
            var zValue = currSpecs[z];
            var zValueInd = selectedSpecs.indexOf(zValue);
            selectedSpecs.splice(zValueInd,1);
            console.log('selectedSpecs', selectedSpecs);
            var markSpec = $(".st-detail-attr>dl.st-attr>dd[data-spec='"+zValue+"']").parent().children('dd');
            markInvalidSpec(markSpec, selectedSpecs);
        }
    }
    function renderProductPictures()
    {
        //產品放大鏡
        Util.zoomImage();
        //移動端產品輪播
        if(Util.isIE() === false){
            new Swiper('.swiper-container', {
                pagination: {
                    el: '.swiper-pagination'
                }
            });
        }
    }
}
();
</script>
@endpush