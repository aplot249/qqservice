# 仓库目录说明
1. 提供的qq.jar、和web.zip 压缩文件放在zip目录之下
2. qq目录是通过 `jar xvf qq.jar` 解压而来的
3. web目录是通过 `unzip web.zip -d web` 解压而来的
4. qqservice.sql 是数据库文件

# 数据库操作
1. 创建数据库：`create database if not exists qqservice charset utf8 collate utf8_general_ci;`
2. 导入数据库文件 `mysqldump -uroot -p数据库密码 qqservice < qqservice.sql`

# 修改后端配置
1. 在目录 qq->classes 下找到 application.yaml 文件，进行修改
2. 修改完成后，执行`jar -cvfM0 qq.jar BOOT-INF/classes BOOT-INF/lib META-INF org` 命令原打包成jar文件
3. 后端运行 `java -jar qq.jar`

# 关于前端
1. 前端运行： `npm run serve`
2. 前端打包： `npm run build`
3. 修改后端接口地址： 
* 在目录 web-> src->utils 下找到requests.js 文件的第5行
* 如果前端、后台部署在同一台服务器上，则接口地址改为 127.0.0.1，如果不在同一台服务器上，则填写真是的后端地址。
4. 前端运行的问题：
* 用`npm run build` 进行打包，生成dist目录。
* 配置NGINX的虚拟主机，类似如下：
```
server {
	listen 80;
	listen [::]:80;
	server_name _;
	index index.html;
	location / {
		root /home/web/dist; # dist目录所在的绝对路径
	}
	error_page  404 403 500 502 503 504  /index.html;
}
```
