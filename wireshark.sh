#!/bin/sh

sudo apt install wireshark
sudo apt update
sudo apt upgrade
sudo dpkg-reconfigure wireshark-common
sudo adduser sonulen wireshark
