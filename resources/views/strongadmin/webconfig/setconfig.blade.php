@extends('strongadmin::layouts.app')

@push('styles')
<style>
    /*.layui-form-label{width:150px;}*/
</style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h15"></div>
<form class="layui-form" action="/strongadmin/webconfig/save/config">
    <button type="button" id="clearcache" class="layui-btn layui-btn-sm">清楚快取</button>
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class="layui-this">基本配置</li>
            <li>郵件配置</li>
            <li>註冊&登錄配置</li>
            <li>訂單配置</li>
            <!--<li>產品配置</li>-->
        </ul>
        <div class="layui-tab-content">
            <!--基本設定-->
            <div class="layui-tab-item layui-show">
                <div class="layui-form-item">
                    <label class="layui-form-label">商店標題</label>
                    <div class="layui-input-block">
                        <input type="text" name="store_title" value="{{$data['store_title'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商店關鍵字</label>
                    <div class="layui-input-block">
                        <input type="text" name="meta_keywords" value="{{$data['meta_keywords'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商店描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="meta_description" value="{{$data['meta_description'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>網站通知</label>
                    <div class="layui-input-block">
                        <input type="text" name="notice" value="{{$data['notice'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip">顯示在網站頂部的全域性通知</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>統計程式碼</label>
                    <div class="layui-input-block">
                        <textarea name="statistical_code" autocomplete="off" placeholder="" class="layui-textarea">{{$data['statistical_code'] ?? ''}}</textarea>
                        <div class="layui-word-aux st-form-tip">可以放置百度或者谷歌統計程式碼到 header 頭中。</div>
                    </div>
                </div>
            </div>
            <!--郵件-->
            <div class="layui-tab-item">
                <div class="layui-row">
                    <div class="layui-col-xs6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">發件伺服器</label>
                            <div class="layui-input-block">
                                <input type="text" name="MAIL_HOST" value="{{$data['MAIL_HOST'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip layui-show">發送郵件伺服器，示例：smtp.qq.com</div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">加密協議</label>
                            <div class="layui-input-block">
                                <select name="MAIL_ENCRYPTION">
                                    <option value="">-無-</option>
                                    <option value="ssl" @if(isset($data['MAIL_ENCRYPTION']) && $data['MAIL_ENCRYPTION']=='ssl') selected @endif>SSL</option>
                                    <option value="tls" @if(isset($data['MAIL_ENCRYPTION']) && $data['MAIL_ENCRYPTION']=='tls') selected @endif>TLS</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">埠</label>
                            <div class="layui-input-block">
                                <input type="text" name="MAIL_PORT" value="{{$data['MAIL_PORT'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip layui-show">發送郵件伺服器埠，ssl 加密埠：465；普通埠：25</div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">郵箱帳號</label>
                            <div class="layui-input-block">
                                <input type="text" name="MAIL_USERNAME" value="{{$data['MAIL_USERNAME'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">郵箱密碼</label>
                            <div class="layui-input-block">
                                <input type="password" name="MAIL_PASSWORD" value="{{$data['MAIL_PASSWORD'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">回覆地址</label>
                            <div class="layui-input-block">
                                <input type="text" name="MAIL_REPLYTO_ADDRESS" value="{{$data['MAIL_REPLYTO_ADDRESS'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">回覆名稱</label>
                            <div class="layui-input-block">
                                <input type="text" name="MAIL_REPLYTO_NAME" value="{{$data['MAIL_REPLYTO_NAME'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                            </div>
                        </div>
                        <hr/>
                        <div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-inline">
                                <input id="receiveMailTest" type="text" value="" autocomplete="off" placeholder="收信郵箱地址" class="layui-input">
                            </div>
                            <div class="layui-input-inline">
                                <button type="button" class="layui-btn" id="sendReceiveMailTest">發送測試郵件</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--註冊配置-->
            <div class="layui-tab-item">
                <h3>註冊配置</h3>
                <hr/>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>註冊通知</label>
                    <div class="layui-input-block">
                        <input name="notice_email_signed" lay-text="發送郵件|不發送郵件" @isset($data['notice_email_signed']) checked="" @endisset type="checkbox" lay-skin="switch" >
                        <div class="layui-word-aux st-form-tip layui-show">會員註冊成功后發送郵件驗證通知</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>圖形驗證</label>
                    <div class="layui-input-block">
                        <input name="signup_captcha" lay-text="開啟|不開啟" @isset($data['signup_captcha']) checked="" @endisset type="checkbox" lay-skin="switch" >
                        <div class="layui-word-aux st-form-tip layui-show">開啟圖片驗證碼后在一定程度上防止機器人註冊</div>
                    </div>
                </div>
                <h3>登錄配置</h3>
                <hr/>
                <div class="layui-form-item">
                    <label class="layui-form-label">登錄錯誤（次）</label>
                    <div class="layui-input-block">
                        <input type="text" name="signin_max_attempts" value="{{$data['signin_max_attempts'] ?? ''}}" autocomplete="off" placeholder="次" class="layui-input"> 
                        <div class="layui-word-aux st-form-tip layui-show">允許登錯幾次，不填寫則不限制</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">限制時長（分鐘）</label>
                    <div class="layui-input-block">
                        <input type="text" name="signin_decay_minutes" value="{{$data['signin_decay_minutes'] ?? ''}}" autocomplete="off" placeholder="分鐘" class="layui-input"> 
                        <div class="layui-word-aux st-form-tip layui-show">登錄失敗超過規定次數，禁止多少分鐘登錄,不填寫則預設5分鐘</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>郵箱未驗證提示</label>
                    <div class="layui-input-block">
                        <input name="signin_tip_email_verified" lay-text="開啟|不開啟" @isset($data['signin_tip_email_verified']) checked="" @endisset type="checkbox" lay-skin="switch" >
                        <div class="layui-word-aux st-form-tip">開啟后在登錄成功後會提示：@lang('Your email address is not verified. It is strongly recommended that you verify the email', [], 'en')</div>
                    </div>
                </div>
            </div>
            <!--訂單配置-->
            <div class="layui-tab-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">下單成功</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="notice_email_created_order" lay-skin="switch" lay-text="發送郵件|不發送郵件" @if(isset($data['notice_email_created_order']) && $data['notice_email_created_order'])) checked="" @endif>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">支付成功</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="notice_email_paid_order" lay-skin="switch" lay-text="發送郵件|不發送郵件" @if(isset($data['notice_email_paid_order']) && $data['notice_email_paid_order'])) checked="" @endif>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">發貨成功</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="notice_email_shipped_order" lay-skin="switch" lay-text="發送郵件|不發送郵件" @if(isset($data['notice_email_shipped_order']) && $data['notice_email_shipped_order'])) checked="" @endif>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">訂單關閉</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="notice_email_closed_order" lay-skin="switch" lay-text="發送郵件|不發送郵件" @if(isset($data['notice_email_closed_order']) && $data['notice_email_closed_order'])) checked="" @endif>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>郵箱未驗證提示</label>
                    <div class="layui-input-block">
                        <input name="order_tip_email_verified" lay-text="開啟|不開啟" @isset($data['order_tip_email_verified']) checked="" @endisset type="checkbox" lay-skin="switch" >
                        <div class="layui-word-aux st-form-tip">開啟后在結算頁會提示：@lang('Your email address is not verified. It is strongly recommended that you verify the email', [], 'en')</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>購買限制</label>
                    <div class="layui-input-block">
                        <input name="order_checkout_email_verified" lay-text="開啟|不開啟" @isset($data['order_checkout_email_verified']) checked="" @endisset type="checkbox" lay-skin="switch" >
                        <div class="layui-word-aux st-form-tip layui-show">開啟后只有通過郵箱驗證的才可以下單</div>
                    </div>
                </div>
            </div>
            <!--產品配置-->
            <div class="layui-tab-item">
            </div>
        </div>
    </div>
    <div class="layui-form-item st-form-submit-btn">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="ST-SUBMIT">儲存</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
@endsection

@push('scripts_bottom')
<script>
    !function () {
        //監聽提交
        layui.form.on('submit(ST-SUBMIT)', function (data) {
            //console.log(data)
            Util.postForm('form.layui-form', data.field, false);
            //layer.alert(JSON.stringify(data.field), {
            //    title: '最終的提交資訊'
            //});
            return false;
        });
        //清快取
        $("#clearcache").click(function () {
            $.post('/strongadmin/webconfig/clearcache', function (res) {
                if (res.code === 200) {
                    layer.msg(res.message, {
                        time: 1500
                    });
                }
            });
        });
        //測試郵件
        $("#sendReceiveMailTest").click(function () {
            var addr = $("#receiveMailTest").val();
            $.post('/strongadmin/webconfig/sendReceiveMailTest', {
                addr: addr
                , MAIL_HOST: $("input[name=MAIL_HOST]").val()
                , MAIL_ENCRYPTION: $("select[name=MAIL_ENCRYPTION]").val()
                , MAIL_PORT: $("input[name=MAIL_PORT]").val()
                , MAIL_USERNAME: $("input[name=MAIL_USERNAME]").val()
                , MAIL_PASSWORD: $("input[name=MAIL_PASSWORD]").val()
                , MAIL_REPLYTO_ADDRESS: $("input[name=MAIL_REPLYTO_ADDRESS]").val()
                , MAIL_REPLYTO_NAME: $("input[name=MAIL_REPLYTO_NAME]").val()
            }, function (res) {
                if (res.code === 200) {
                    layer.msg(res.message, {
                        time: 1500
                    });
                } else {
                    layer.alert(res.message);
                }
            });
        });
    }();
</script>
@endpush
