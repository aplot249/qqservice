const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  lintOnSave:false,//是否开启eslint保存检测 ,它的有效值为 true || false || 'error'
})
