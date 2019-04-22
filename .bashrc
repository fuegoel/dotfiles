# Source global definitions
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
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
if [ -f $HOME/Envs ]; then
  export WORKON_HOME=$HOME/Envs
else
  export WORKON_HOME=$HOME/.virtualenvs
fi
source /usr/bin/virtualenvwrapper.sh

# Keychain
if [ -f /usr/bin/keychain ]; then
  eval $(keychain --eval -Q --quiet id_ed25519)
  eval $(keychain --agents ssh,pgp)
fi

# For Tmux(?)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"

# Aliases
if [ -f /usr/bin/lolcat ]; then
  alias clear='clear; echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo'
fi
if [ -f /usr/bin/vimx ]; then
  alias vi='vimx'
  alias vim='vimx'
fi

export PATH="$PATH:$HOME/bin:/usr/local/go/bin"
if [ -d "$HOME/.local/vim/bin/"  ] ; then
  export PATH="$HOME/.local/vim/bin:$PATH"
fi

source $HOME/tmux_completion.sh
