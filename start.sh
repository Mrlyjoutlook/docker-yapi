#!/bin/bash

if [ ! -f "/home/yapi/init.lock" ];then
echo "初始化，启动运行"
npm run install-server && npm start
else
echo "启动运行"
npm start
fi