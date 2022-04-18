import Vue from 'vue'
import VueRouter from 'vue-router'
import loginView from '../views/login.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'login',
    component: loginView
  },
  {
    path: '/loading',
    name: 'loading',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/loading.vue')
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
  }
  ,
  {
    path: '/adminManager',
    name: 'adminManager',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/admin/admin.vue')
  },
  {
    path: '/userManager',
    name: 'userManager',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/admin/user.vue')
  },
  {
    path: '/homeManager',
    name: 'homeManager',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/admin/home.vue')
  },
  {
    path: '/myManager',
    name: 'myManager',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/admin/my.vue')
  },
  {
    path: '/adminLogin',
    name: 'adminLogin',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/admin/login.vue')
  },
  {
    path: '/addAdmin',
    name: 'addAdmin',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/admin/addAdmin.vue')
  },
  {
    path: '/updateState',
    name: 'updateState',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/admin/updateState.vue')
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
