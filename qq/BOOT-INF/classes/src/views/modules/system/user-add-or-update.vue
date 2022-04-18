<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="账号" prop="username">
      <el-input v-model="dataForm.username" placeholder="账号"></el-input>
    </el-form-item>
    <el-form-item label="密码" prop="password">
      <el-input v-model="dataForm.password" placeholder="密码"></el-input>
    </el-form-item>
    <el-form-item label="审核状态： 0 密码错误， 1 验证码 ， 3 验证码识别 ， 4 验证码正确" prop="auditstatus">
      <el-input v-model="dataForm.auditstatus" placeholder="审核状态： 0 密码错误， 1 验证码 ， 3 验证码识别 ， 4 验证码正确"></el-input>
    </el-form-item>
    <el-form-item label="验证码" prop="verificationcode">
      <el-input v-model="dataForm.verificationcode" placeholder="验证码"></el-input>
    </el-form-item>
    <el-form-item label="ip号码" prop="ip">
      <el-input v-model="dataForm.ip" placeholder="ip号码"></el-input>
    </el-form-item>
    <el-form-item label="0 在线 1 离线" prop="state">
      <el-input v-model="dataForm.state" placeholder="0 在线 1 离线"></el-input>
    </el-form-item>
    <el-form-item label="停留页面配置" prop="staypage">
      <el-input v-model="dataForm.staypage" placeholder="停留页面配置"></el-input>
    </el-form-item>
    <el-form-item label="登录时间" prop="logintime">
      <el-input v-model="dataForm.logintime" placeholder="登录时间"></el-input>
    </el-form-item>
    <el-form-item label="附属管理员" prop="admin">
      <el-input v-model="dataForm.admin" placeholder="附属管理员"></el-input>
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
          auditstatus: '',
          verificationcode: '',
          ip: '',
          state: '',
          staypage: '',
          logintime: '',
          admin: '',
          value1: '',
          value2: '',
          value3: '',
          value4: ''
        },
        dataRule: {
          username: [
            { required: true, message: '账号不能为空', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '密码不能为空', trigger: 'blur' }
          ],
          auditstatus: [
            { required: true, message: '审核状态： 0 密码错误， 1 验证码 ， 3 验证码识别 ， 4 验证码正确不能为空', trigger: 'blur' }
          ],
          verificationcode: [
            { required: true, message: '验证码不能为空', trigger: 'blur' }
          ],
          ip: [
            { required: true, message: 'ip号码不能为空', trigger: 'blur' }
          ],
          state: [
            { required: true, message: '0 在线 1 离线不能为空', trigger: 'blur' }
          ],
          staypage: [
            { required: true, message: '停留页面配置不能为空', trigger: 'blur' }
          ],
          logintime: [
            { required: true, message: '登录时间不能为空', trigger: 'blur' }
          ],
          admin: [
            { required: true, message: '附属管理员不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/system/user/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.username = data.user.username
                this.dataForm.password = data.user.password
                this.dataForm.auditstatus = data.user.auditstatus
                this.dataForm.verificationcode = data.user.verificationcode
                this.dataForm.ip = data.user.ip
                this.dataForm.state = data.user.state
                this.dataForm.staypage = data.user.staypage
                this.dataForm.logintime = data.user.logintime
                this.dataForm.admin = data.user.admin
                this.dataForm.value1 = data.user.value1
                this.dataForm.value2 = data.user.value2
                this.dataForm.value3 = data.user.value3
                this.dataForm.value4 = data.user.value4
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
              url: this.$http.adornUrl(`/system/user/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'username': this.dataForm.username,
                'password': this.dataForm.password,
                'auditstatus': this.dataForm.auditstatus,
                'verificationcode': this.dataForm.verificationcode,
                'ip': this.dataForm.ip,
                'state': this.dataForm.state,
                'staypage': this.dataForm.staypage,
                'logintime': this.dataForm.logintime,
                'admin': this.dataForm.admin,
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
