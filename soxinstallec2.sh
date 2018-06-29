#!/bin/sh

mkdir sox
cd sox
wget http://sourceforge.net/projects/sox/files/sox/14.4.2/sox-14.4.2.tar.gz
tar xvfz sox-14.4.2.tar.gz
cd sox-14.4.2
./configure
make -s
make install
export PATH=$PATH:/usr/local/bin
sudo ldconfig
