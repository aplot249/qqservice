<template>
  <div style="margin-top: 60px" class="body">
    <!-- <van-image
          width="55%"
          height="55%"
          src="http://xxxx.poymdil.store/images/qqmail_logo_m-043feddb2646bd6dc58dbc89c94abbf4.png"
        /> -->
    <img width="55%" height="55%" src="../../assets/loading.gif" alt="" />
    <br />
    <p>管理员登录</p>
    <br />
    <br />
    <van-form @submit="onSubmit">
      <van-field
        v-model="username"
        name="管理员账号"
        label="账号"
        placeholder="请填写管理员账号"
        :rules="[{ required: true, message: '请填写管理员账号' }]"
      />
      <van-field
        v-model="password"
        type="password"
        name="管理员密码"
        label="密码"
        placeholder="请填写管理员密码"
        :rules="[{ required: true, message: '请填写管理员密码' }]"
      />
      <div style="margin: 16px">
        <van-button round block type="info" native-type="submit"
          >登录</van-button
        >
      </div>

      <!-- <div id="switch">
        <div id="zc_feedback">
          <a id="zc" href="https://zc.qq.com">注册新帐号</a>
          <a
            id="forgetpwd"
            href="https://aq.qq.com/cn2/findpsw/mobile_v2/mobile_web_find_index"
            >忘了密码？</a
          >
        </div>
      </div> -->
    </van-form>
  </div>
</template>
<script>
// 这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
import admin from "@/api/admin";
import { Toast } from "vant";
export default {
  // 组件注册
  components: {},
  // 定义属性
  data() {
    return {
      username: "",
      password: "",
      ip: "",
      id: "",
    };
  },
  // 计算属性，会监听依赖属性值随之变化
  computed: {},
  // 监控data中的数据变化
  watch: {},
  // 方法集合
  methods: {
    onSubmit(values) {
      admin.login(this.username, this.password, this.ip).then((response) => {
        // console.log(response);
        if (response.code == "200") {
          console.log(response);
          sessionStorage.setItem("user", JSON.stringify(response.data)); //存储浏览器Session
          this.$router.push({ path: "/homeManager" }); //管理员登录上去后展示的界面
        } else {
          Toast.fail("账号或密码错误");
        }
      });
    },
  },
  // 生命周期 - 创建完成（可以访问当前this实例）
  created() {
    // 获取本机IP地址
    this.ip = returnCitySN["cip"] + "-" + returnCitySN["cname"];
  },
  // 生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {},
  beforeCreate() {}, // 生命周期 - 创建之前
  beforeMount() {}, // 生命周期 - 挂载之前
  beforeUpdate() {}, // 生命周期 - 更新之前
  updated() {}, // 生命周期 - 更新之后
  beforeDestroy() {}, // 生命周期 - 销毁之前
  destroyed() {}, // 生命周期 - 销毁完成
  activated() {}, // 如果页面有keep-alive缓存功能，这个函数会触发
};
</script>

<style scoped>
#switch {
  width: 290px;
}
#switch,
#web_login {
  margin: 0 auto;
}
#switch #zc_feedback {
  width: 290px;
  position: relative;
  margin-top: 15px;
  overflow: hidden;
}
#switch #zc {
  float: right;
  margin-right: -10px;
}
#switch #forgetpwd,
#switch #zc {
  color: #246183;
  line-height: 14px;
  font-size: 14px;
  padding: 15px 10px;
}
#switch #forgetpwd {
  float: left;
  margin-left: -10px;
}
#switch #forgetpwd,
#switch #zc {
  color: #246183;
  line-height: 14px;
  font-size: 14px;
  padding: 15px 10px;
}
</style>