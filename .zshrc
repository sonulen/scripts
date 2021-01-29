# sonulen edition

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# sonulen edition
export TERM="xterm-256color"

ZSH_THEME="spaceship"

# ORDER
SPACESHIP_PROMPT_ORDER=(
  time     #
  vi_mode  # these sections will be
  user     # before prompt char
  host     #
  dir
  git
  node
  ruby
  xcode
  swift
  golang
  docker
  venv
  pyenv
  line_sep      # Line break
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
)


SPACESHIP_TIME_SHOW="true"
SPACESHIP_CHAR_SUFFIX=" "

# USER
SPACESHIP_USER_PREFIX="" # remove `with` before username
SPACESHIP_USER_SUFFIX="" # remove space before host

# HOST
# Result will look like this:
#   username@:(hostname)
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") "

# DIR
SPACESHIP_DIR_TRUNC_REPO="false"
SPACESHIP_DIR_TRUNC='0' # show only last directory

plugins=(
  git
  zsh-autosuggestions
  virtualenv
)

source /home/AVIASIM/tolmachevaa/.oh-my-zsh/oh-my-zsh.sh
[[ -s/home/AVIASIM/tolmachevaa/.autojump/etc/profile.d/autojump.sh ]] && source /home/AVIASIM/tolmachevaa/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
source /home/AVIASIM/tolmachevaa/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
screenfetch
. /usr/share/staff/profile 2>/dev/null

alias clr="timeout 2 cmatrix -u 2 -s -C cyan; clear"
alias ll="exa -h -l --git"
alias llt='f(){ exa -h -l --git --tree -L $1; }; f'
