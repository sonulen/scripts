#!/bin/sh

sudo apt-get update
sudo apt-get install qt-sdk qt5-default libqt5svg5-dev
sudo ln -s /usr/lib/x86_64-linux-gnu/qt5/ /usr/lib/qt5
cd qwt-6.1.2/
qmake -makefile qwt.pro
make -j4 all
sudo cp lib/* /usr/lib
cd ../fplib/libtm
make -j4 all
sudo cp libtm.so /usr/lib
cd ../../
sudo chmod +x prebuild_linux.sh
chmod +x prebuild_linux.sh
./prebuild_linux.sh
qmake -makefile skat.pro
make -j4 skat
