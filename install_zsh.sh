#!/bin/sh

sudo apt-get install zsh
chsh -s $(which zsh)
zsh --version
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cd ~;
git clone git://github.com/wting/autojump.git
cd autojump
./install.py
cp .zshrc ~/.zshrc
