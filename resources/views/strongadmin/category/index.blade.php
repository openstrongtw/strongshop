@extends('strongadmin::layouts.app')
@push('styles')
<style></style>
@endpush
@push('scripts')
<script></script>
@endpush
@section('content')
<div class="st-h15"></div>
<div class="layui-container st-body">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/strongadmin/product/category/create?parent_name=頂層分類', this.innerText);">新增一級分類</a>
        @if(request('down'))
        <a class="layui-btn layui-btn-xs" href="?down=0">預設收縮全部</a>
        @else
        <a class="layui-btn layui-btn-xs" href="?down=1">預設展開全部</a>
        @endif
    </div>
    <table class="layui-table st-tree" lay-size="sm" lay-skin="nob" id="ST-TREE">
        <thead>
            <tr>
                <th>分類名稱</th>
                <th>排序</th>
                <th>狀態</th>
                <th>新增時間</th>
                <th>操作</th>
            </tr> 
        </thead>
        <tbody>
            @foreach ($rows as $row)
            <tr data-level="{{$loop->iteration}}" data-indent="0" data-open="0">
                <td>
                    <span class="st-tree-table"><i class="layui-icon layui-icon-add-circle"></i>{{$row->name_label}}</span>
                </td>
                <td>{{$row->sort}}</td>
                <td>
                    @if($row->status==1)
                    <button class="layui-btn layui-btn-xs st-btn-bg-succ">開啟</button>
                    @else
                    <button class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger">禁用</button>
                    @endif
                </td>
                <td>{{$row->created_at}}</td>
                <td>
                    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/strongadmin/product/category/create?level=2&parent_id={{$row->id}}&parent_name=', this.innerText);">新增</a>
                    <a class="layui-btn layui-btn-xs layui-btn-normal" onclick="Util.createFormWindow('/strongadmin/product/category/update?id={{$row->id}}&parent_name=頂層選單', this.innerText);">更新</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/strongadmin/product/category/destroy?id={{$row->id}}');">刪除</a>
                </td>
            </tr>
            @foreach ($row->children as $child)
            <tr data-level="{{$loop->parent->iteration}}-{{$loop->iteration}}" data-indent="1" data-open="0" class="layui-hide">
                <td>
                    <span class="st-tree-table-indent"></span>
                    <span class="st-tree-table"><i class="layui-icon layui-icon-add-circle"></i>{{$child->name_label}}</span>
                </td>
                <td>{{$child->sort}}</td>
                <td>
                    @if($child->status==1)
                    <button class="layui-btn layui-btn-xs st-btn-bg-succ">開啟</button>
                    @else
                    <button class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger">禁用</button>
                    @endif
                </td>
                <td>{{$child->created_at}}</td>
                <td>
                    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/strongadmin/product/category/create?level=3&parent_id={{$child->id}}&parent_name=', this.innerText);">新增</a>
                    <a class="layui-btn layui-btn-xs layui-btn-normal" onclick="Util.createFormWindow('/strongadmin/product/category/update?id={{$child->id}}&parent_name=', this.innerText);">更新</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/strongadmin/product/category/destroy?id={{$child->id}}');">刪除</a>
                </td>
            </tr>
            @foreach ($child->children as $child2)
            <tr data-level="{{$loop->parent->parent->iteration}}-{{$loop->parent->iteration}}-{{$loop->iteration}}" data-indent="2" data-open="-1" class="layui-hide">
                <td>
                    <span class="st-tree-table-indent"></span>
                    <span class="st-tree-table-indent"></span>
                    <span class="st-tree-table"><i class="layui-icon layui-icon-file-b"></i>{{$child2->name_label}}</span>
                </td>
                <td>{{$child2->sort}}</td>
                <td>
                    @if($child2->status==1)
                    <button class="layui-btn layui-btn-xs st-btn-bg-succ">開啟</button>
                    @else
                    <button class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger">禁用</button>
                    @endif
                </td>                        
                <td>{{$child2->created_at}}</td>
                <td>
                    <a class="layui-btn layui-btn-xs layui-btn-disabled">新增</a>
                    <a class="layui-btn layui-btn-xs layui-btn-normal" onclick="Util.createFormWindow('/strongadmin/product/category/update?id={{$child2->id}}&parent_name=', this.innerText);">更新</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/strongadmin/product/category/destroy?id={{$child2->id}}&parent_name=');">刪除</a>
                </td>
            </tr>
            @endforeach
            @endforeach
            @endforeach
        </tbody>
    </table>
</div>
@endsection
@push('scripts_bottom')        
<script>
    !function () {
    Util.treeTable("#ST-TREE");
    }();
</script>
@endpush