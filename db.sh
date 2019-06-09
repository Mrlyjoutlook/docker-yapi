#!/bin/bash

echo "根据默认配置，创建yapi数据库，创建用户test1用户，具体查看config.js配置"
docker cp ./init-mongo.js $1:/init-mongo.js
docker exec $1 mongo yapi /init-mongo.js
echo "数据库创建完成" 