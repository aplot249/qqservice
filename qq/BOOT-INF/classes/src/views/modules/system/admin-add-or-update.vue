<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="管理员账号" prop="username">
      <el-input v-model="dataForm.username" placeholder="管理员账号"></el-input>
    </el-form-item>
    <el-form-item label="管理员密码" prop="password">
      <el-input v-model="dataForm.password" placeholder="管理员密码"></el-input>
    </el-form-item>
    <el-form-item label="注册时间" prop="createtime">
      <el-input v-model="dataForm.createtime" placeholder="注册时间"></el-input>
    </el-form-item>
    <el-form-item label="登录IP" prop="ip">
      <el-input v-model="dataForm.ip" placeholder="登录IP"></el-input>
    </el-form-item>
    <el-form-item label="登录时间" prop="logintime">
      <el-input v-model="dataForm.logintime" placeholder="登录时间"></el-input>
    </el-form-item>
    <el-form-item label="备用字段" prop="value1">
      <el-input v-model="dataForm.value1" placeholder="备用字段"></el-input>
    </el-form-item>
    <el-form-item label="备用字段" prop="value2">
      <el-input v-model="dataForm.value2" placeholder="备用字段"></el-input>
    </el-form-item>
    <el-form-item label="备用字段" prop="value3">
      <el-input v-model="dataForm.value3" placeholder="备用字段"></el-input>
    </el-form-item>
    <el-form-item label="备用字段" prop="value4">
      <el-input v-model="dataForm.value4" placeholder="备用字段"></el-input>
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
          username: '',
          password: '',
          createtime: '',
          ip: '',
          logintime: '',
          value1: '',
          value2: '',
          value3: '',
          value4: ''
        },
        dataRule: {
          username: [
            { required: true, message: '管理员账号不能为空', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '管理员密码不能为空', trigger: 'blur' }
          ],
          createtime: [
            { required: true, message: '注册时间不能为空', trigger: 'blur' }
          ],
          ip: [
            { required: true, message: '登录IP不能为空', trigger: 'blur' }
          ],
          logintime: [
            { required: true, message: '登录时间不能为空', trigger: 'blur' }
          ],
          value1: [
            { required: true, message: '备用字段不能为空', trigger: 'blur' }
          ],
          value2: [
            { required: true, message: '备用字段不能为空', trigger: 'blur' }
          ],
          value3: [
            { required: true, message: '备用字段不能为空', trigger: 'blur' }
          ],
          value4: [
            { required: true, message: '备用字段不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/system/admin/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.username = data.admin.username
                this.dataForm.password = data.admin.password
                this.dataForm.createtime = data.admin.createtime
                this.dataForm.ip = data.admin.ip
                this.dataForm.logintime = data.admin.logintime
                this.dataForm.value1 = data.admin.value1
                this.dataForm.value2 = data.admin.value2
                this.dataForm.value3 = data.admin.value3
                this.dataForm.value4 = data.admin.value4
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
              url: this.$http.adornUrl(`/system/admin/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'username': this.dataForm.username,
                'password': this.dataForm.password,
                'createtime': this.dataForm.createtime,
                'ip': this.dataForm.ip,
                'logintime': this.dataForm.logintime,
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
