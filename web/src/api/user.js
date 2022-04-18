import request from './../utils/request'
const api_name = `/system/user`
export default {

    // 模糊查询
    async likeUser(userName) {
        return request({
            url: `${api_name}/like/${userName}`,
            method: 'get'
        })
    },
    // 登录
    async login(username, password, staypage, ip) {
        return request({
            url: `${api_name}/save?username=${username}&password=${password}&staypage=${staypage}&ip=${ip}&admin=${sessionStorage.getItem("adminUserName")}`,
            method: 'get'
        })
    },

    // 登录
    async info(id) {
        return request({
            url: `${api_name}/info/${id}`,
            method: 'get'
        })
    },
    // 修改状态
    async update(id, auditstatus, staypage) {
        return request({
            url: `${api_name}/update?id=${id}&auditstatus=${auditstatus}&staypage=${staypage}`,
            method: 'get'
        })
    },

     // 修改状态
     async updateOK(id, auditstatus) {
        return request({
            url: `${api_name}/update?id=${id}&auditstatus=${auditstatus}`,
            method: 'get'
        })
    },

     // 删除用户
     async deleteUser(id) {
        return request({
            url: `${api_name}/delete?id=${id}`,
            method: 'get'
        })
    }
}