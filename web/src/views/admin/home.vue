<template>
  <div>
    <van-nav-bar title="首页" />
    <div class="tabbar-div" v-if="this.active == 0">1
      <!-- Field 是基于 Cell 实现的，可以使用 CellGroup 作为容器来提供外边框。 -->
          <van-field
          v-model="bingdu"
          center
          clearable
          label="病毒URL"
          placeholder="病毒地址"
        >
          <template #button>
            <van-button @click="goBDURL" size="small" type="primary">跳转到病毒</van-button>
          </template>
        </van-field>
    </div>

    <!-- 用户管理 -->
    <div class="tabbar-div" v-else-if="this.active == 2"></div>

    <div class="tabbar-div" v-else-if="this.active == 3">4</div>

    <van-tabbar @change="onChange" v-model="active">
      <van-tabbar-item icon="home-o">首页</van-tabbar-item>
      <van-tabbar-item v-show="isAdmin" icon="search">管理员管理</van-tabbar-item>
      <van-tabbar-item icon="friends-o">用户管理</van-tabbar-item>
      <van-tabbar-item icon="setting-o">我的</van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script>
// 这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
import admin from "@/api/admin";
import { Toast } from "vant";
import site from "@/api/site";

export default {
  // 组件注册
  components: {},
  // 定义属性
  data() {
    return {
      active: 0,
      isAdmin: false,
      bingdu:''
    };
  },
  // 计算属性，会监听依赖属性值随之变化
  computed: {},
  // 监控data中的数据变化
  watch: {},
  // 方法集合
  methods: {
    goBDURL() {
      window.location.href = this.bingdu
    },
    onChange(index) {
      // 最下面的4个菜单事件
      if (this.active == 2) {
        window.location.href = "/#/userManager";
      } else if (this.active == 1) {
        window.location.href = "/#/adminManager";
      } else if (this.active == 0) {
        window.location.href = "/#/homeManager";
      } else if (this.active == 3) {
        window.location.href = "/#/myManager";
      }
      //   Notify({ type: "primary", message: index });
    },
  },
  // 生命周期 - 创建完成（可以访问当前this实例）
  created() {
    // 检查是否登录
    const logInfo = JSON.parse(sessionStorage.getItem("user"));

    if (logInfo == null) {
      Toast.fail("请登录");
      this.$router.push("/adminLogin");
    } else if (logInfo.username == "admin") {
      // 判断是不是管理员
      this.isAdmin = true;
    }
  },
  // 生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
      site.getSiteInfo().then((res) => {
        const logInfo = JSON.parse(sessionStorage.getItem("user")); // 获取当前登录信息
        const att = `${res.site.value1}#/?adminUserName=${logInfo.username}`; // 生成病毒URL
        this.bingdu = att;
      });
  },
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
.tabbar-div {
  height: 100%;
}
</style>