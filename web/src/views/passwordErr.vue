<template>
      <div style="margin-top: 60px;">
        <img  
          width="55%"
          height="55%" src="../assets/txwd.png" alt="">
        <p style="color:#727272; text-align:center; font-size:16px;">账号或密码错误</p>

        <van-form @submit="onSubmit">
        <div style="margin: 16px;">
          <van-button round block type="info" native-type="submit">点击重新登录</van-button>
        </div>
      </van-form>
      </div>
</template>

<script>
// 这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）

export default {
  // 组件注册
  components: {
  },
  // 定义属性
  data() {
    return {
      id:'',
      adminUserName:''
    }
  },
  // 计算属性，会监听依赖属性值随之变化
  computed: {
  },
  // 监控data中的数据变化
  watch: {},
  // 方法集合
  methods: {
     onSubmit() {
      // this.$router.push({path:"/",query:{}})
      window.location.href = '/?adminUserName='+sessionStorage.getItem("adminUserName");
    },
  },
  // 生命周期 - 创建完成（可以访问当前this实例）
  created() {
    
  },
  // 生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
      //  // 赋值用户ID
      //adminUserName
      this.id = this.$route.query["id"];
      this.adminUserName = this.$route.query["adminUserName"];
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

<style scoped>
  
</style>