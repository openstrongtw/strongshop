@extends($layouts)

@push('styles')
@endpush

@section('content')
@include('layouts.includes.breadcrumb')
<!--主體區域-->
<div class="st-main">
    <div class="container">
        <div class="st-main-detail-reviews-header">
            <h4 class="page-header">
                {{$rows->total()}} Ratings
            </h4>
            <p>@lang('5 stars') {{$rows->total()>0 ? round($data_total['star5']/$rows->total()*100, 2) : 0}}%</p>
            <p>@lang('4 stars') {{$rows->total()>0 ? round($data_total['star4']/$rows->total()*100, 2) : 0}}%</p>
            <p>@lang('3 stars') {{$rows->total()>0 ? round($data_total['star3']/$rows->total()*100, 2) : 0}}%</p>
            <p>@lang('2 stars') {{$rows->total()>0 ? round($data_total['star2']/$rows->total()*100, 2) : 0}}%</p>
            <p>@lang('1 star') {{$rows->total()>0 ? round($data_total['star1']/$rows->total()*100, 2) : 0}}%</p>
            <p>
                <a class="btn btn-warning" href="{{route('comment.create', ['sku'=>request('sku')])}}" target="_parent">@lang('Create New Comment')</a>
            </p>
        </div>
        <div class="st-main-detail-reviews-content">
            @foreach($rows as $row)
            <dl>
                <dt>
                    <font>{{$row->last_name}}</font>
                    <span>
                        @for($i=1;$i<=$row->star;$i++)
                        <i class="bi-star-fill"></i>
                        @endfor
                    </span>
                </dt>
                <dd class="st-text">{{$row->content}}</dd>
                <dd class="st-datetime">{{$row->created_at}}</dd>
            </dl>
            @endforeach
        </div>
        <!--分頁-->
        <nav aria-label="Page navigation">
            {{$rows->links()}}
        </nav>
    </div>
</div>
<div class="st-h100"></div>
</div>
@endsection
@push('scripts_bottom')
<script>
    !function () {

    }
    ();
</script>

@endpush