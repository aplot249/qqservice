import Vue from 'vue'
import App from './App.vue'
import router from './router'
import './plugins/vant.js'
// 引入axios文件：会自动执行其内部代码
import axios from 'axios'

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css' //样式必须引入
Vue.use(ElementUI)

Vue.prototype.$http = axios
Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
