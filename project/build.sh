#!/bin/sh
if [ "$1" = "build" ];then
    mkdir /home/changsheng/project/project19821/project
    cp -a /home/changsheng/project/project19821/server/. /home/changsheng/project/project19821/project/
    cd /home/changsheng/project/project19821/project
    rm -rf /home/changsheng/project/project19821/server
    echo "执行成功"
fi
