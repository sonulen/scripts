#!/bin/sh

sudo apt install python3-venv python3-pip
python3 -m pip install --user --upgrade pip
python3 -m pip install --user virtualenv
python3 -m virtualenv env

# source env/bin/activate Для активации окружения
# deactivate для выхода
