#!/bin/bash
#更新系统
apt-get update
apt-get upgrade -y

#安装依赖
apt-get install -y build-essential automake autoconf libtool pkg-config intltool libssl-dev libcurl4-openssl-dev libglib2.0-dev libevent-dev libminiupnpc-dev libappindicator-dev libssl0.9.8

#下载源码包
wget https://download.transmissionbt.com/files/transmission-2.82.tar.xz

#解码源码包
xz -d transmission-2.82.tar.xz
tar -xvf transmission-2.82.tar

#进入配置并编译
cd transmission-2.82
./configure
make
make install
cd

#启动transmission
/usr/local/bin/transmission-daemon