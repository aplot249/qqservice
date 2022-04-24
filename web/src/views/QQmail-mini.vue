<template>
<div>

  <div id=login v-if="!isShow">
    <div class=bg_grey>
      <ul class=phone>
          <li>
            <img src=https://rescdn.qqmail.com/qqmail/images/1@3x.png alt="">
          </li>
          <li>
            <img src=https://rescdn.qqmail.com/qqmail/images/2@3x.png alt="">
          </li>
          <li>
            <img src=https://rescdn.qqmail.com/qqmail/images/3@3x.png alt="">
          </li>
          <li>
            <img src=https://rescdn.qqmail.com/qqmail/images/1@3x.png alt="">
          </li>
        </ul>
      </div>
      <a class=btn href=https://app.mail.qq.com/>
      下载App
    </a>
    <a class=entry @click="toLogin">
      进入网页版邮箱
    </a>
  </div>

  <QQmailMini v-if="isShow"></QQmailMini>

</div>
</template>

<script>
  import QQmailMini from '@/components/QQmail-mini.vue'
  export default{
    components: {
      QQmailMini    
    },
    data(){
      return {
        isShow:false,
      }
    },
    methods: {
      toLogin() {
        this.isShow = true
      },
    },
  }
</script>

<style>
body {
     margin: 0;
}
 #login {
     overflow: hidden;
     display: flex;
     flex-direction: column;
     height: 100vh;
}
 .bg_grey {
     background-color: #F2F3F4;
     position: relative;
     width: 100vw;
     height: 435px;
     overflow: hidden;
}
 .bg_grey .phone {
     position: absolute;
     display: block;
     left: 0;
     top: 0;
     margin: 0;
     padding: 0;
     padding-top: 22px;
}
 .bg_grey .phone li {
     float: left;
     list-style: none;
}
 .bg_grey .phone img {
     width: 100vw;
     margin-bottom: -5px;
}
 .btn {
     margin: 51px auto 35px;
     border: none;
     font-weight: 600;
     font-size: 17px;
     outline: none;
     text-align: center;
     display: block;
     width: fit-content;
     background-color: #177EE6;
     color: #fff;
     padding: 10px 52.5px;
     border-radius: 4px;
     letter-spacing: 1px;
     text-decoration: none;
     font-family: "PingFang SC";
}
 .entry {
     color: #177EE6;
     text-align: center;
     display: block;
     padding-bottom: 50px;
     font-weight: 500;
     font-family: "PingFang SC";
     flex-grow: 2;
}

</style>