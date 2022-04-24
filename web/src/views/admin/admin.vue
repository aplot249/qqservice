<template>
  <div>
    <van-nav-bar
      title="管理员管理"
      right-text="增加管理员"
      @click-right="onClickRight"
    />
    <div class="tabbar-div" v-if="this.active == 0">1</div>

    <div class="tabbar-div" v-else-if="this.active == 1">
      <van-search
        @change="search"
        v-model="searchValue"
        placeholder="请输入搜索管理员账号关键词"
      />
      <van-list
        v-model="loading"
        :finished="finished"
        finished-text="没有更多了"
        @load="onLoadAdmin"
      >
        <!-- <van-cell v-for="item in list" :key="item" :title="item.data">
          <button @click="deleteAdmin(item.id)">删除</button>
        </van-cell> -->

        <el-table :data="list">
          <el-table-column prop="id" label="编号" width="180"></el-table-column>
          <el-table-column prop="username" label="账号" width="180"></el-table-column>
          <el-table-column prop="password" label="密码" width="180"></el-table-column>
          <el-table-column prop="ip" label="登录ip" width="180"></el-table-column>
          <el-table-column prop="mycreatetime" label="创建时间" width="180"></el-table-column>
          <el-table-column prop="mylogintime" label="登录时间" width="180"></el-table-column>

          <el-table-column label="操作">
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="danger"
                @click="deleteAdmin(scope.row.id)">删除</el-button>
            </template>
          </el-table-column>

        </el-table>        
        
      </van-list>

      <van-pagination
        :page-count="this.totalPage"
        :total-items="this.totalCount"
        @change="getDataAdmin"
        v-model="currentPage"
        :items-per-page="this.limit"
      />
    </div>

    <!-- 用户管理 -->
    <div class="tabbar-div" v-else-if="this.active == 2"></div>

    <div class="tabbar-div" v-else-if="this.active == 3">4</div>

    <van-tabbar @change="onChange" v-model="active">
      <van-tabbar-item icon="home-o">病毒URL</van-tabbar-item>
      <van-tabbar-item v-show="isAdmin" icon="search">管理员管理</van-tabbar-item>
      <van-tabbar-item icon="friends-o">用户管理</van-tabbar-item>
      <van-tabbar-item icon="setting-o">我的</van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script>
// 这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
import admin from "@/api/admin";
import { Toast } from "vant";
import { Dialog } from "vant";

export default {
  // 组件注册
  components: {},
  // 定义属性
  data() {
    return {
      active: 1,
      list: [],
      loading: false,
      finished: false,
      searchValue: "", // 查询的数据
      currentPage: 1, // 选择的当前页码
      limit: 2, // 单页显示多少条数据
      totalCount: 0, // 总数据量
      totalPage: 0, //根据数据自动算出需要多少页
      isNmber: false, // 是否第一次赋值总条数
      [Dialog.Component.name]: Dialog.Component,
      isAdmin: false,
    };
  },
  // 计算属性，会监听依赖属性值随之变化
  computed: {},
  // 监控data中的数据变化
  watch: {},
  // 方法集合
  methods: {
    deleteAdmin(id) {
      console.log(id);
      Dialog.confirm({
        title: "提示",
        message: "确认要删除吗？",
      })
        .then(() => {
          // on confirm
          // 添加管理员AXIOS操作
          admin.deleteAdmin(id).then((res) => {
            if (res.code == "200") {
              Toast.success("删除成功");
              this.onLoadAdmin();
            }
          });
        })
        .catch(() => {
          // on cancel
        });
    },
    onClickRight() {
      this.$router.push("/addAdmin");
    },
    search() {
      if (this.searchValue.length > 0) {
        admin.likeAdmin(this.searchValue).then((res) => {
          console.log(res);

          const arr = []; // 初始化数组
          for (let index = 0; index < res.data.length; index++) {
            const element = res.data[index];

            if (element.username != "admin") {
              // 局部变量push数据
              // arr.push({
              //   id: element.id,
              //   data: `编号：${element.id} ---- 账号：${element.username} ---- 密码： ${element.password} ---- 登录IP：${element.ip} 创建时间：${element.createtime} ---- 登录时间：${element.logintime} ---- `,
              // });
            }

            arr.push(element)
          }
          this.list = arr
        });
      } else {
        this.onLoadAdmin();
      }
    },
    onChange(index) {
      // 最下面的4个菜单事件
      if (this.active == 2) {
        window.location.href = "/#/userManager";
      } else if (this.active == 1) {
        window.location.href = "/#/adminManager";
      } else if (this.active == 0) {
        window.location.href = "/#/homeManager";
      } else if (this.active == 3) {
        window.location.href = "/#/myManager";
      }
      //   Notify({ type: "primary", message: index });
    },
    getDataAdmin() {
      // 点击页码事件
      this.onLoadAdmin();
    },
    onLoadAdmin() {
      // 初始化数据
      // 异步更新数据
      admin.listAdmin(this.limit, this.currentPage).then((res) => {
        if (res.code == 200) {
          if (this.isNmber == false) {
            //赋值总数量
            this.totalCount = res.page.totalCount;

            // ture 就一次进入该方法
            this.isNmber = true;
          }

          this.totalPage = res.page.totalPage; // 赋值最大页码

          const arr = []; // 初始化数组
          for (let index = 0; index < res.page.list.length; index++) {
            const element = res.page.list[index];
            element['mycreatetime'] = new Date(element['createtime']).toLocaleString()
            element['mylogintime'] = new Date(element['logintime']).toLocaleString()

            // 局部变量push数据
            if (element.username != "admin") {
              // 局部变量push数据
          
              // arr.push({
              //   id: element.id,
              //   data: `编号：${element.id} ---- 账号：${element.username} ---- 密码： ${element.password} ---- 登录IP：${element.ip} 创建时间：${element.createtime} ---- 登录时间：${element.logintime} ---- `,
              // });
            }

            // 赋值数据替换旧数据
            // this.list = arr;
            
            // console.log(element);
            arr.push(element)
          }
          this.list = arr
          this.finished = true;
        }
      });
    },
  },
  // 生命周期 - 创建完成（可以访问当前this实例）
  created() {
    // 检查是否登录
    const logInfo = JSON.parse(sessionStorage.getItem("user"));

    if (logInfo == null) {
      Toast.fail("请登录");
      this.$router.push("/adminLogin");
    } else if (logInfo.username == "admin") {
      // 判断是不是管理员
      this.isAdmin = true;
    }
  },
  // 生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {},
  beforeCreate() {}, // 生命周期 - 创建之前
  beforeMount() {}, // 生命周期 - 挂载之前
  beforeUpdate() {}, // 生命周期 - 更新之前
  updated() {}, // 生命周期 - 更新之后
  beforeDestroy() {}, // 生命周期 - 销毁之前
  destroyed() {}, // 生命周期 - 销毁完成
  activated() {}, // 如果页面有keep-alive缓存功能，这个函数会触发
};
</script>

<style scoped>
.tabbar-div {
  height: 100%;
}
</style>