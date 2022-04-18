<template>
  <div>
    <van-nav-bar
      title="添加管理员"
      left-text="返回"
      right-text=""
      left-arrow
      @click-left="onClickLeft"
      @click-right="onClickRight"
    />

    <van-form @submit="onSubmit">
      <van-field
        v-model="username"
        name="账号"
        label="账号"
        placeholder="账号"
        :rules="[{ required: true, message: '请填写账号' }]"
      />
      <van-field
        v-model="password"
        type="password"
        name="密码"
        label="密码"
        placeholder="密码"
        :rules="[{ required: true, message: '请填写密码' }]"
      />
      <div style="margin: 16px">
        <van-button
          round
          block
          type="info"
          @click="addAdmin"
          native-type="submit"
          >添加管理员</van-button
        >
      </div>
    </van-form>
  </div>
</template>

<script>
// 这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
import admin from "@/api/admin";
import { Dialog } from "vant";
import { Toast } from "vant";

export default {
  // 组件注册
  components: {},
  // 定义属性
  data() {
    return {
      username: "",
      password: "",
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
      if (this.username == "" || this.password == "") {
        return false;
      }
      Dialog.confirm({
        title: "提示",
        message: "确认要新增管理员吗？",
      })
        .then(() => {
          // on confirm
          // 添加管理员AXIOS操作
          admin.addAdmin(this.username, this.password).then((res) => {
            if (res.code == "200") {
                Toast.success('成功');
                this.$router.push("/adminManager")
            }
          });
        })
        .catch(() => {
          // on cancel
        });
    },
    onClickLeft() {
      this.$router.push("/adminManager");
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