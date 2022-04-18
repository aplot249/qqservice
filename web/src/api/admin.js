import request from './../utils/request'
const api_name = `/system/admin`
export default {

    // 模糊查询
    async likeAdmin(userName) {
        return request({
            url: `${api_name}/like/${userName}`,
            method: 'get'
        })
    },
    // 列表Admin
    async listAdmin(limit, page) {
        return request({
            url: `${api_name}/list?limit=${limit}&page=${page}&sidx=1&order=dasc`,
            method: 'get'
        })
    },

    // 列表用户
    async listUser(limit, page) {
        return request({
            url: `/system/user/list?limit=${limit}&page=${page}&sidx=1&order=dasc&admin=${JSON.parse(sessionStorage.getItem("user")).username}`,
            method: 'get'
        })
    },

    // 登录
    async login(username, password, ip) {
        return request({
            url: `${api_name}/login?username=${username}&password=${password}&ip=${ip}`,
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
    async addAdmin(username, password) {
        return request({
            url: `${api_name}/save?username=${username}&password=${password}`,
            method: 'get'
        })
    },

    // 删除
    async deleteAdmin(id) {
        return request({
            url: `${api_name}/delete?ids=${id}`,
            method: 'get'
        })
    }
}