<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="网站名称" prop="sitename">
      <el-input v-model="dataForm.sitename" placeholder="网站名称"></el-input>
    </el-form-item>
    <el-form-item label="网站头像" prop="siteicon">
      <el-input v-model="dataForm.siteicon" placeholder="网站头像"></el-input>
    </el-form-item>
    <el-form-item label="备案号" prop="filingno">
      <el-input v-model="dataForm.filingno" placeholder="备案号"></el-input>
    </el-form-item>
    <el-form-item label="是否启用站点" prop="enablesite">
      <el-input v-model="dataForm.enablesite" placeholder="是否启用站点"></el-input>
    </el-form-item>
    <el-form-item label="网站关闭说明" prop="closinginstructions">
      <el-input v-model="dataForm.closinginstructions" placeholder="网站关闭说明"></el-input>
    </el-form-item>
    <el-form-item label="备注" prop="value1">
      <el-input v-model="dataForm.value1" placeholder="备注"></el-input>
    </el-form-item>
    <el-form-item label="备注" prop="value2">
      <el-input v-model="dataForm.value2" placeholder="备注"></el-input>
    </el-form-item>
    <el-form-item label="备注" prop="value3">
      <el-input v-model="dataForm.value3" placeholder="备注"></el-input>
    </el-form-item>
    <el-form-item label="备注" prop="value4">
      <el-input v-model="dataForm.value4" placeholder="备注"></el-input>
    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          sitename: '',
          siteicon: '',
          filingno: '',
          enablesite: '',
          closinginstructions: '',
          value1: '',
          value2: '',
          value3: '',
          value4: ''
        },
        dataRule: {
          sitename: [
            { required: true, message: '网站名称不能为空', trigger: 'blur' }
          ],
          siteicon: [
            { required: true, message: '网站头像不能为空', trigger: 'blur' }
          ],
          filingno: [
            { required: true, message: '备案号不能为空', trigger: 'blur' }
          ],
          enablesite: [
            { required: true, message: '是否启用站点不能为空', trigger: 'blur' }
          ],
          closinginstructions: [
            { required: true, message: '网站关闭说明不能为空', trigger: 'blur' }
          ],
          value1: [
            { required: true, message: '备注不能为空', trigger: 'blur' }
          ],
          value2: [
            { required: true, message: '备注不能为空', trigger: 'blur' }
          ],
          value3: [
            { required: true, message: '备注不能为空', trigger: 'blur' }
          ],
          value4: [
            { required: true, message: '备注不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/system/site/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.sitename = data.site.sitename
                this.dataForm.siteicon = data.site.siteicon
                this.dataForm.filingno = data.site.filingno
                this.dataForm.enablesite = data.site.enablesite
                this.dataForm.closinginstructions = data.site.closinginstructions
                this.dataForm.value1 = data.site.value1
                this.dataForm.value2 = data.site.value2
                this.dataForm.value3 = data.site.value3
                this.dataForm.value4 = data.site.value4
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/system/site/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'sitename': this.dataForm.sitename,
                'siteicon': this.dataForm.siteicon,
                'filingno': this.dataForm.filingno,
                'enablesite': this.dataForm.enablesite,
                'closinginstructions': this.dataForm.closinginstructions,
                'value1': this.dataForm.value1,
                'value2': this.dataForm.value2,
                'value3': this.dataForm.value3,
                'value4': this.dataForm.value4
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>
