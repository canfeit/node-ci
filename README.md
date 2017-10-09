# node 8.6.0 jenkins 2.83 持续集成，基于alpine:edge
## 启动容器
```bash
sudo docker run -d -p 8080:8080 -p 81:91 --name jenkins canfeit/node-ci
sudo docker logs jenkins #查看日志找出密码
```
浏览器访问: [http://localhost:8080](http://localhost:8080)

## Jenkins配置
1. 使用日志中的密码进入 Jenkins 控制台
2. 可按照向导操作完成初始化，或直接关闭向导
3. 系统管理>管理插件>高级>上传插件,上传 18github.hpi postbuild-task.hpi 安装插件，安装过程中会有部分依赖项安装失败，可手动上传hpi文件重新安装
4. 安装完成后，重启:http://test.kedo.so:8080/safeRestart
5. 系统管理>系统设置>GitHub,完成 GitHub 配置
6. 新建

 GitHub Project url/Git Repository URL:https://github.com/canfeit/incloud.git

 构建 Execute shell
    ```bash
    export NODE_ENV=production
    npm i
    npm test
    ```
 构建后操作 post build task Script
    ```bash
    export NODE_ENV=production
    /portal/node_modules/.bin/pm2 kill
    rm -rf /portal
    cp -R target/portal /
    mv -f node_modules /portal
    cd /portal
    npm start
    ```
浏览器访问: [http://localhost:81](http://localhost:81)

## 管理
 jenkins 重启:http://test.kedo.so:8080/safeRestart
 
 github tokens:https://github.com/settings/tokens
