import axios from 'axios'

// 创建axios实例
const service = axios.create({
    // baseURL: 'http://127.0.0.1:6060',
    // baseURL: 'http://192.168.1.7:6060',
    // baseURL: 'http://49.232.106.138:6060',
    baseURL: 'http://159.75.10.144:6060',
    timeout: 15000 // 请求超时时间
})

// http request 拦截器
service.interceptors.request.use(
    config => {
        // token 先不处理，后续使用时在完善
        //判断cookie是否有token值
        // if (cookies.get("token")) {
        //     //token值放入headers中
        //     config.headers["token"] = cookies.get("token")
        // }
        return config
    },
    err => {
        return Promise.reject(err)
    }
)

// http response 拦截器
service.interceptors.response.use(
    response => {
        return response.data;

        // 状态吗
        // if (response.data.code === 208) {
        //     //弹出登录层
        //     loginEvent.$emit('loginDialogEvent')
        //     return
        // } else {
        //     if (response.data.code !== 200) {
        //         Message({
        //             message: response.data.message,
        //             type: 'error',
        //             duration: 5 * 1000
        //         })
        //         return Promise.reject(response.data)
        //     } else {
        //         return response.data
        //     }
        // }

    },
    error => {
        return Promise.reject(error.response)
    })

export default service