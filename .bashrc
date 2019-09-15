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
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
if [ -f $HOME/Envs ]; then
  export WORKON_HOME=$HOME/Envs
else
  export WORKON_HOME=$HOME/.virtualenvs
fi
source /usr/local/bin/virtualenvwrapper.sh

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

export PATH="$PATH:$HOME/bin:/usr/local/go/bin:$HOME/go/bin:/usr/local/lib/nodejs/node-v12.4.0-linux-x64/bin"
if [ -d "$HOME/.local/vim/bin/"  ] ; then
  export PATH="$HOME/.local/vim/bin:$PATH"
fi

source $HOME/tmux_completion.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
setxkbmap -option caps:escape

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="/home/batushka/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

workon work3
