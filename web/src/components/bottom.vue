<template>
    <van-tabbar @change="onChange" v-model="active">
      <van-tabbar-item icon="home-o">首页</van-tabbar-item>
      <van-tabbar-item v-show="isAdmin" icon="search">管理员管理</van-tabbar-item>
      <van-tabbar-item icon="friends-o">用户管理</van-tabbar-item>
      <van-tabbar-item icon="setting-o">我的</van-tabbar-item>
    </van-tabbar>
</template>

<script>
export default {
  setup() {
    // name:'Bottom',
    components:{}
  },
}
</script>

