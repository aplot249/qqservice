import request from './../utils/request'
const api_name = `/system/site`
export default {

    // 模糊查询
    async getSiteInfo() {
        return request({
            url: `${api_name}/info/1`,
            method: 'get'
        })
    },
}