# yapi-docker

## problem

### npm install 遇到权限问题，报错 Permission denied

用`npm install --unsafe-perm=true --allow-root`安装，可以尝试`sudo`运行。

或者修改目录权限`sudo chmod -R 777 .`

### edit database config

创建数据库

```bash
use yapi
```

创建用户并配置权限

```bash
# 此处代码是按照yapi默认的来的
db.createUser({user:"test1",pwd:"test1",roles:[{"role":"readWrite","db":"yapi"}]})
```

## use

```bash
docker-compose up
# 处理报错 error: MongoError: Authentication failed., mongodb Authentication failed，需要创建数据库和用户，可执行以下命令
/bin/bash db.sh container_id
```

你可以先单独启动 mongodb 服务，运行`/bin/bash db.sh container_id`

## change log
