#!/bin/bash

git clone https://github.com/zehome/MLVPN.git
cd MLVPN
sudo apt -y install build-essential make autoconf libev-dev libsodium-dev libpcap-dev pkg-config
sudo ./autogen.sh
sudo ./configure --enable-filters LDFLAGS="-Wl,-Bdynamic" --prefix=/usr --sysconfdir=/etc --localstatedir=/var
sudo ./makemake
sudo make install
sudo mkdir /etc/mlvpn
sudo cp ./doc/examples/mlvpn.init.d /etc/init.d/mlvpn
sudo cp ./doc/examples/mlvpn.default /etc/default/mlvpn
sudo mkdir /etc/mlvpn/mlvpn
sudo cp ./doc/examples/mlvpn_updown.sh /etc/mlvpn/mlvpn
sudo cp ./doc/examples/mlvpn.conf /etc/mlvpn/
sudo chmod 600 /etc/mlvpn/mlvpn.conf
sudo chmod 700 /etc/mlvpn/mlvpn/mlvpn_updown.sh
