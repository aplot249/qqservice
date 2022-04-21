import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  //下面是给用户看的界面
  {
    path: '/',
    name: 'login',
    component: () => import('../views/login.vue')
  },
  {
    path: '/loading',
    name: 'loading',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import('../views/loading.vue')
  }
  ,
  {
    path: '/check',
    name: 'check',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/checkCode.vue')
  }
  ,
  {
    path: '/err',
    name: 'err',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/errCode.vue')
  }
  ,
  {
    path: '/errpass',
    name: 'errpass',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/passwordErr.vue')
  } 
  ,
  {
    path: '/loadingWD',
    name: 'loadingWD',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/loadingWD.vue')
  },


  //下方是给管理员看的界面
  {
    path: '/adminManager',
    name: 'adminManager',
    component: () => import('../views/admin/admin.vue')
  },
  {
    path: '/userManager',
    name: 'userManager',
    component: () => import('../views/admin/user.vue')
  },
  {
    //管理员登录上去后展示的界面
    path: '/homeManager',
    name: 'homeManager',
    component: () => import('../views/admin/home.vue')
  },
  {
    path: '/myManager',
    name: 'myManager',
    component: () => import('../views/admin/my.vue')
  },
  {
    path: '/adminLogin',
    name: 'adminLogin',
    component: () => import('../views/admin/login.vue')
  },
  {
    path: '/addAdmin',
    name: 'addAdmin',
    component: () => import('../views/admin/addAdmin.vue')
  },
  {
    path: '/updateState',
    name: 'updateState',
    component: () => import('../views/admin/updateState.vue')
  }
]

const router = new VueRouter({
  // mode: 'history',
  base: process.env.BASE_URL,
  routes
})

// 二、定义一个Vue.mixin
Vue.mixin({
  beforeCreate(){
    if(this.$route.meta.title){
      document.title=this.$route.meta.title
    }else{
      document.title="腾讯文档"//没有就默认
    }
  }
})

export default router
