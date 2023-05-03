<div class="container">
    <div class="row">
        <!--主體左側-產品圖冊資訊-->
        <div class="col-sm-12 col-md-7 col-lg-5">
            <!--PC端輪播圖-->
            <div class="st-detail-img hidden-xs hidden-sm">
                <div class="st-detail-img-left pull-left">
                    <ul>
                        @foreach($row->asset_img_photos as $photo)
                        <li @if ($loop->first)class="active" @endif><img src="{{$photo['src']}}" data-src="{{$photo['src']}}" alt="{{$row->title}}"></li>
                        @endforeach
                    </ul>
                </div>
                <div class="st-detail-img-right pull-right">
                    <div class="pic">
                        @isset($row->asset_img_photos[0]['src'])
                        <img src="{{$row->asset_img_photos[0]['src']}}" alt="{{$row->title}}">
                        @endisset
                        <div class="magnify"></div>
                    </div>
                    <div class="bigpic">
                        @isset($row->asset_img_photos[0]['src'])
                        <img src="{{$row->asset_img_photos[0]['src']}}" alt="{{$row->title}}"  >
                        @endisset
                    </div>
                    <div class="st-detail-img-right-share">
                        <!--分享-->
                        <p class="st-share">@lang('Share to'): 
                            <a href="#" class="bi-facebook"></a>
                            <a href="#" class="bi-twitter"></a>
                            <a href="#" class="bi-instagram"></a>
                            <a href="#" class="bi-linkedin"></a>
                        </p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--移動端輪播圖-->
            <div class="st-detail-img visible-xs visible-sm">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        @foreach($row->asset_img_photos as $photo)
                        <div class="swiper-slide"><img src="{{$photo['src']}}" alt="{{$row->title}}" class="img-responsive"></div>
                        @endforeach
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-5 col-lg-7">
            <div class="row">
                <!--主體右側-產品屬性資訊-->
                <div class="col-sm-12 col-lg-7">
                    <div class="st-detail-attr">
                        <h3>{{$row->title}}</h3>
                        <dl class="st-general st-itemcode">
                            <dd>@lang('Item code #'):{{$row->sku}}</dd>
                        </dl>
                        <dl class="st-general st-price">
                            <dt>{{$_current_currency_name}} {{$row->sale_price}}<del>{{$_current_currency_name}} {{$row->original_price}}</del></dt>
                        </dl>
                        @foreach($price_sepcs as $price_sepc)
                        <dl class="st-attr @if($price_sepc['is_show_img'] ==1)st-picture @endif">
                            <dt>{{$price_sepc['name']}}:</dt>
                            @foreach($price_sepc['spu_specs'] as $spu_spec)
                            <dd title="{{$spu_spec['pivot']['spec_value']}}" data-toggle="tooltip" data-placement="top" data-spec="{{$spu_spec['pivot']['spec_value']}}" @if($price_sepc['pivot']['spec_value'] == $spu_spec['pivot']['spec_value']) class="active" @endif>
                                @if($price_sepc['is_show_img'] ==1)
                                <img src="{{$spu_spec['product_img']}}" />
                                @else
                                {{$spu_spec['pivot']['spec_value']}}
                                @endif
                            </dd>
                            @endforeach
                        </dl>
                        @endforeach
                    </div>
                </div>
                <!--主體右側-操作按鈕-->
                <div class="col-sm-12 col-lg-5 st-detail-btn">
                    <div class="st-detail-btn-right">
                        <!--批發資訊-->
                        @if(count($row->wholesale_set['num']))
                        <div class="st-whosale">
                            <table class="table">
                                <!--<caption>@lang('Wholesale')</caption>-->
                                <thead>
                                    <tr>
                                        <th>@lang('QTY')</th>
                                        <th>@lang('Price')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($row->wholesale_set['num'] as $wholesale_num)
                                    <tr>
                                        <td>
                                            @if($loop->last) <font>≥</font> @else <font>≥</font> @endif
                                            {{$wholesale_num}}
                                        </td>
                                        <td>{{$_current_currency_name}} {{$row->wholesale_set['price'][$loop->index]}}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        @endif
                        <!--庫存狀態-->
                        @if($row->stock_status == 1 && $row->stock >0)
                        <p class="st-instock">{{$row->stock}} @lang('in stock').</p>
                        @else
                        <p class="st-stockout">@lang('Stock Out.')</p>
                        @endif
                        <!--購物數量-->
                        <p class="st-qty">
                            @lang('QTY'): <input id="ST-QTY" name="qty" value="1" type="number" min="1" max="99999" />
                        </p>
                        <!--按鈕-->
                        <p class="st-btn">
                            <button class="btn btn-primary addtocart" onclick="Util.addtocart({{$row->id}}, $('#ST-QTY').val())">
                                <span class="glyphicon glyphicon-shopping-cart"></span>@lang('ADD TO CART')
                            </button>
                            <button class="btn btn-info buynow" onclick="Util.buyNow({{$row->id}}, $('#ST-QTY').val())">
                                <span class="glyphicon glyphicon-hand-right"></span>@lang('Buy Now')
                            </button>
                            <button class="btn btn-default addtowishlist" onclick="Util.addToWishList({{$row->id}})">
                                <span class="glyphicon @if($row->is_collected)glyphicon-heart @else glyphicon-heart-empty @endif"></span>@lang('Add to wish list')
                            </button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="st-h50"></div>
<div class="container">
    <div class="st-main-detail">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#Details" role="tab" data-toggle="tab" class="bi-stickies"> @lang('Details')</a></li>
            @if(!empty($row->related_accessories_sku))
            <li role="presentation"><a href="#Accessories"role="tab" data-toggle="tab" class="bi-tools"> @lang('Accessories')</a></li>
            @endif
            <li role="presentation"><a href="#Delivery"role="tab" data-toggle="tab" class="bi-map"> @lang('Delivery & Tax')</a></li>
            <li role="presentation"><a href="#Returns" role="tab" data-toggle="tab" class="bi-bootstrap-reboot"> @lang('Returns')</a></li>
            <li role="presentation"><a href="#Reviews" role="tab" data-toggle="tab" class="bi-emoji-smile"> @lang('Reviews')</a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="st-h10"></div>
            <div role="tabpanel" class="tab-pane active" id="Details">
                @if(!empty($general_sepcs))
                <table class="table table-striped">
                    <caption>@lang('Product specification')</caption>
                    <tbody>
                        @foreach($general_sepcs as $general_sepc)
                        <tr>
                            <th>{{$general_sepc['name']}}</th>
                            <td>{{$general_sepc['pivot']['spec_value']}}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="st-h50"></div>
                @endif
                @if($row->details)
                {!!$row->details!!}
                @else
                @foreach($row->asset_img_photos as $photo)
                <img src="{{$photo['src']}}" alt="{{$row->title}}" class="img-responsive" />
                @endforeach
                @endif
            </div>
            @if(!empty($row->related_accessories_sku))
            <div role="tabpanel" class="tab-pane" id="Accessories">
                <table class="table st-cart-table">
                    <tbody>
                        @foreach($row->related_accessories_sku as $related_accessory)
                        <tr>
                            <td>
                                <div class="media">
                                    <div class="media-left">
                                        <a href="{{route('product.show', ['id'=>$related_accessory->id])}}">
                                            <img class="media-object" src="{{$related_accessory->img_cover}}" alt="{{$related_accessory->title}}" title="{{$related_accessory->title}}" />
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h5 class="media-heading"><a href="{{route('product.show', ['id'=>$related_accessory->id])}}">{{$related_accessory->title}}</a></h5>
                                        <p class="st-itemcode"> <small>@lang('Item code #'): {{$related_accessory->sku}}</small></p>
                                        <p class="st-price">
                                            {{$_current_currency_name}} {{$related_accessory->sale_price}} x 
                                            <input value="1" name='accNum' type="number" />
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td class="st-wholesale hidden-xs">
                                <table class="table">
                                    <tbody>
                                        @foreach($related_accessory->wholesale_set['num'] as $wholesale_num)
                                        <tr>
                                            <td>
                                                @if($loop->last) <font>≥</font> @else <font>≥</font> @endif
                                                {{$wholesale_num}}
                                            </td>
                                            <td>{{$_current_currency_name}} {{$related_accessory->wholesale_set['price'][$loop->index]}}</td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </td>
                            <td>
                                <button onclick="Util.addtocart({{$related_accessory->id}}, $(this).parentsUntil('tr').siblings().find('input[name=accNum]').val()); $(this).children('i').removeClass('bi-cart').addClass('bi-cart-fill');" class="btn btn-default btn-xs"> 
                                    <i class="bi-cart"></i> 
                                    <span class="hidden-xs">@lang('Add to cart')</span>
                                    <span class="visible-xs-inline">@lang('Add')</span>
                                </button>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            @endif
            <div role="tabpanel" class="tab-pane" id="Delivery">
            </div>
            <div role="tabpanel" class="tab-pane" id="Returns">
            </div>
            <div role="tabpanel" class="tab-pane" id="Reviews">
                <iframe src="{{route('comment.list', ['product_id'=>$row->id,'sku'=>$row->sku,'spu'=>$row->spu,'no_header'=>1])}}" frameborder="0" scrolling="yes" style="width:100%;height: 800px;"></iframe>
            </div>
        </div>
    </div>
</div>