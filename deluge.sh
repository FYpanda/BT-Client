#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get install python python-twisted python-openssl python-setuptools intltool python-xdg python-chardet geoip-database python-libtorrent python-notify python-pygame python-glade2 librsvg2-common xdg-utils python-mako -y
wget http://download.deluge-torrent.org/source/deluge-1.3.13.tar.gz
tar -zxvf deluge-1.3.13.tar.gz
cd deluge-1.3.13
python setup.py install --install-layout=deb
cd ~
deluged
screen -fa -d -m -S deluge-web deluge-web
sed -i '/exit 0/d' /etc/rc.local
echo "deluged" >> /etc/rc.local
echo "screen -fa -d -m -S deluge-web deluge-web" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local