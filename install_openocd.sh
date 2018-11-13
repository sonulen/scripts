#!/bin/sh

if [ "$(id -u)" = "0" ]; then
	echo "Sorry, you are root."
	exit 1
fi

sudo apt remove openocd
sudo apt install aclocal
sudo apt install autoconf
git clone git://git.code.sf.net/p/openocd/code openocd-code
cd openocd-code
./bootstrap
./configure
make clean
sudo make uninstall
make -j4
sudo make install
cd ../
sudo rm -rf openocd-code
