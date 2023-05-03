@if(isset($specs) && isset($productSpecs))
<!--價格規格-->
<fieldset class="layui-elem-field">
    <legend>價格規格<font class="st-sepc-tip">（作為產品價格屬性選擇）</font></legend>
    <div class="layui-field-box">
        <div class="layui-form-item">
            @foreach ($specs as $spec)
            @if($spec['spec_type']==1)
            <label class="layui-form-label st-form-input-required">{{$spec->name_label}}</label>
            <div class="layui-input-inline">
                @if($spec['input_type'] == 1)
                <select name="productSpec" lay-filter='productSpec' data-specId="{{$spec->id}}" data-specType="{{$spec->spec_type}}">
                    <option value=""> -- </option>
                    @foreach ($spec['select_values_array'] as $select_value)
                    <option value="{{$select_value}}" @if(isset($productSpecs[$spec->id]) && $productSpecs[$spec->id] == $select_value)selected @endif>{{$select_value}}</option>
                    @endforeach
                </select>
                @elseif($spec['input_type'] == 2)
                <input type="text" name="productSpec" value="{{$productSpecs[$spec->id] ?? ''}}" data-specId="{{$spec->id}}" data-specType="{{$spec->spec_type}}" class="layui-input">
                @endif
            </div>
            @endif
            @endforeach
        </div>
    </div>
</fieldset>
<!--普通規格-->
<fieldset class="layui-elem-field">
    <legend>普通規格 <font class="st-sepc-tip">（作為普通產品參數顯示）</font></legend>
    <div class="layui-field-box">
        @foreach ($specs as $spec)
        @if($spec['spec_type']==2)
        <div class="layui-form-item">
            <label class="layui-form-label">{{$spec->name_label}}</label>
            <div class="layui-input-inline">
                @if($spec['input_type'] == 1)
                <select name="productSpec" lay-filter='productSpec' data-specId="{{$spec->id}}" data-specType="{{$spec->spec_type}}">
                    <option> -- </option>
                    @foreach ($spec['select_values_array'] as $select_value)
                    <option value="{{$select_value}}" @if(isset($productSpecs[$spec->id]) && $productSpecs[$spec->id] == $select_value)selected @endif>{{$select_value}}</option>
                    @endforeach
                </select>
                @elseif($spec['input_type'] == 2)
                <input type="text" name="productSpec" value="{{$productSpecs[$spec->id] ?? ''}}" data-specId="{{$spec->id}}" data-specType="{{$spec->spec_type}}" class="layui-input">
                @endif
            </div>
        </div>
        @endif
        @endforeach
    </div>
</fieldset>
@endif
