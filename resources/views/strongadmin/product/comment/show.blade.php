@extends('strongadmin::layouts.app')

@push('styles')
<style></style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h15"></div>
<table class="layui-table" lay-size="sm">
    <colgroup>
        <col width="150"><col>
        <col><col>
        <col width="150"><col>
        <col><col>
    </colgroup>
    <thead>
        <tr>
            <th colspan="4" style="text-align: center;background: #eee;">基本資訊</th>
        </tr> 
    </thead>
    <tbody>
        <tr>
            <td><strong>{{$model->getAttributeLabel('user_id')}}</strong></td>
            <td>{{$model->user_id}}</td>
            <td><strong>{{$model->getAttributeLabel('first_name')}}</strong></td>
            <td>{{$model->first_name}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('last_name')}}</strong></td>
            <td>{{$model->last_name}}</td>
            <td><strong>{{$model->getAttributeLabel('country')}}</strong></td>
            <td>{{$model->country}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('at_user_id')}}</strong></td>
            <td>{{$model->at_user_id}}</td>
            <td><strong>{{$model->getAttributeLabel('product_id')}}</strong></td>
            <td>{{$model->product_id}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('product_sku')}}</strong></td>
            <td>{{$model->product_sku}}</td>
            <td><strong>{{$model->getAttributeLabel('content')}}</strong></td>
            <td>{{$model->content}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('likes')}}</strong></td>
            <td>{{$model->likes}}</td>
            <td><strong>{{$model->getAttributeLabel('more')}}</strong></td>
            <td>{{$model->more}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('status')}}</strong></td>
            <td>{{$model->status}}</td>
            <td><strong>{{$model->getAttributeLabel('credits')}}</strong></td>
            <td>{{$model->credits}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('created_at')}}</strong></td>
            <td>{{$model->created_at}}</td>
            <td><strong>{{$model->getAttributeLabel('updated_at')}}</strong></td>
            <td>{{$model->updated_at}}</td>
        </tr>
    </tbody>
</table>
@endsection

@push('scripts_bottom')
<script>
    !function () {
        //...
    }();
</script>
@endpush
