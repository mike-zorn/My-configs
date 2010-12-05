# .bashrc

set -o vi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias vi=vim
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias cdrsh='cd ~/Documents/research/Masters'
alias newterm='urxvt &>/dev/null &'
alias shutitdown='sudo shutdown -hP now'

# Setup Prompt

BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
NONE="\[\033[0m\]"
PURPLE="\[\033[0;35m\]"
GREEN="\[\033[0;32m\]"
PS1="${PURPLE}\h ${GREEN}[\T] ${CYAN}\W ${BLUE}\$ ${NONE}" 

# Environment Variables

export PYTHONPATH=~/fipy:~/Documents/research/Masters/python:$PYTHONPATH
export FIPY_VIEWER='matplotlib'
export SVN_EDITOR=vim
export EDITOR=vim
export PATH=~/android-sdk/tools:$PATH
export AUTO_DIR=/usr/local/auto
