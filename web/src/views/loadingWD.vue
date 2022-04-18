<template>
      <div style="margin-top: 60px;">
           <!-- <van-image
            src="http://xxxx.poymdil.store/update/img/4loading.gif"
            /> -->
          <img   
          width="55%"
          height="55%" src="../assets/txwd.png" alt="">
            <p style="color:#727272; text-align:center; font-size:16px;">正在加载文档，请稍等...</p>
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
    
  },
  // 生命周期 - 创建完成（可以访问当前this实例）
  created() {
    
  },
  // 生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
           //  // 赋值用户ID
      this.id = this.$route.query["id"];
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