@extends('layouts.app')

@section('content')
<div class="st-signin">
    <div class="container">
        <div class="col-sm-6">
            <div class="page-header">
                <h4>@lang('Create New Customer Account')</h4>
            </div>
            <form class="form-horizontal" method="post" id="ST-FORM">
                @csrf
                <p class="page-header">@lang('Personal Information')</p>
                <div class="form-group">
                    <label class="col-md-4 control-label">@lang('First Name') <font>*</font></label>
                    <div class="col-md-8">
                        <input name="first_name" type="text" class="form-control" placeholder="@lang('First Name')" value="{{old('first_name')}}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">@lang('Last Name') <font>*</font></label>
                    <div class="col-md-8">
                        <input name="last_name" type="text" class="form-control" placeholder="@lang('Last Name')" value="{{old('last_name')}}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">@lang('Country') <font>*</font></label>
                    <div class="col-md-8">
                        <select class="form-control" name="country_code">
                            <option> -- {{__('Country')}} -- </option>
                            @foreach($countries as $countryCode=>$country)
                            <option value="{{$countryCode}}" @if($countryCode === old('country_code')) selected @endif>{{$country}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <p class="page-header">@lang('Sign in Information')</p>
                <div class="form-group">
                    <label class="col-md-4 control-label">@lang('Email') <font>*</font></label>
                    <div class="col-md-8">
                        <input name="email" type="text" class="form-control" placeholder="@lang('Email')" value="{{old('email')}}" required>
                        <p class="help-block">@lang('We need your email to send you your order confirmation and tracking details. We will never pass your email to third parties.')</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">@lang('Password') <font>*</font></label>
                    <div class="col-md-8">
                        <input name="password" type="password" class="form-control" placeholder="@lang('Password')" value="{{old('password')}}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label">@lang('Confirm Password') <font>*</font></label>
                    <div class="col-md-8">
                        <input name="password_confirmation" type="password" class="form-control" placeholder="@lang('Confirm Password')" value="{{old('password_confirmation')}}" required>
                    </div>
                </div>
                @if($show_captcha)
                <div class="form-group">
                    <label class="col-md-4 control-label">@lang('Captcha') <font>*</font></label>
                    <div class="col-md-4">
                        <input name="captcha" type="text" class="form-control" placeholder="" value="" required>
                    </div>
                    <div class="col-md-4">
                        <img style="cursor: pointer;" src="{{route('register.captcha', [time()])}}" onclick="this.src = '{{route('register.captcha')}}?' + Math.random()" title="@lang('Click on the change')" />
                    </div>
                </div>
                @endif
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-8">
                        <div class="checkbox">
                            <label>
                                <input name="remember" type="checkbox" value="1" checked> @lang('Remember Me')
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-8">
                        <button type="submit" class="btn btn-primary">@lang('Sign up')</button>
                        <p class="st-h50"><a href="{{route('login')}}"> @lang('I will sign in.')</a></p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection


@push('scripts_bottom')
<script>
    !function () {
        $("button[type='submit']").click(function () {
            layer.load(1, {shade: [0.5, '#000']});
            $('#ST-FORM').ajaxSubmit(function (res) {
                layer.closeAll();
                if (res.code !== 200) {
                    Util.showErrors(res.message);
                    return;
                }
                var redirectTo = res.redirectTo;
                window.location.href = redirectTo ? redirectTo : '/';
                return;
            });
            return false;
        });
    }
    ();
</script>
@endpush