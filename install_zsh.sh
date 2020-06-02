#!/bin/sh
cd ~;
sudo apt-get install zsh

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir ~/.local/share/fonts/
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mkdir ~/.config/fontconfig/
mkdir ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

git clone git://github.com/wting/autojump.git
cd autojump
./install.py
cd ../

# Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

cat<< EOF > ~/.zshrc
# sonulen edition

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TERM="xterm-256color"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(
  git
  zsh-autosuggestions
  virtualenv
)

source /home/sonulen/.oh-my-zsh/oh-my-zsh.sh

[[ -s /home/sonulen/.autojump/etc/profile.d/autojump.sh ]] && source /home/sonulen/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
source /home/sonulen/wrk/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias clr="timeout 2 cmatrix -u 2 -s -C cyan; clear"

EOF

source .zshrc
chsh -s $(which zsh)
