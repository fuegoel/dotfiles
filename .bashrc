#!/usr/bin/env bash

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export EDITOR=vim

# Bash Git prompt
GIT_PROMPT_ONLY_IN_REPO=0
GIT_PROMPT_THEME=Custom
GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
source ~/.bash-git-prompt/gitprompt.sh

# Virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=$HOME/.venv
source $HOME/.local/bin/virtualenvwrapper.sh
workon work

# Keychain
if [ -f /usr/bin/keychain ]; then
  eval $(keychain --eval -Q --quiet id_ed25519)
  eval $(keychain --agents ssh,pgp)
fi

# For Tmux(?)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"

# Aliases
if [ -f ~/bin/lolcat ]; then
  alias clear='clear; echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo'
fi
if [ -f /usr/bin/vimx ]; then
  alias vi='vimx'
  alias vim='vimx'
fi
if [ -f /usr/local/bin/terragrunt ]; then
  alias tg='terragrunt'
  alias tgfm='terragrunt hclfmt .'
fi
alias tf='terraform'
alias k=kubectl

#export PATH="$PATH:$HOME/bin:/usr/local/go/bin:$HOME/go/bin:/usr/local/lib/nodejs/node-v12.4.0-linux-x64/bin:$HOME/.local/bin:$HOME/.virtualenvs/work/bin"
export PATH="$PATH:$HOME/bin:/usr/local/go/bin:$HOME/go/bin:/usr/local/lib/nodejs/node-v12.4.0-linux-x64/bin:$HOME/.local/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
setxkbmap -option caps:escape
# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Load Bash It
source "$BASH_IT"/bash_it.sh

umask 022

npm set prefix ~/.npm
PATH="$HOME/.npm/bin:$PATH"
PATH="./node_modules/.bin:$PATH"

export ANSIBLE_CONFIG=~/.ansible.cfg

eval "$(direnv hook bash)"
