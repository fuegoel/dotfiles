# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export EDITOR=vim
umask 0022

# Bash Git prompt
GIT_PROMPT_ONLY_IN_REPO=0
GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
source ~/.bash-git-prompt/gitprompt.sh

# Virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
export WORKON_HOME=$HOME/Envs
source /usr/bin/virtualenvwrapper.sh

# Keychain
eval $(keychain --eval -Q --quiet id_ed25519)
eval $(keychain --agents ssh,pgp)

# For Tmux(?)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"

# Aliases
alias clear='clear; echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo'
alias vi='vimx'
alias vim='vimx'

export PATH="$PATH:$/HOME/anaconda3/bin"
