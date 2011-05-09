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
alias mounthabakuk='sshfs habakuk.gmu.edu:/Users/matkins ~/habakuk'
alias umounthabakuk='fusermount -uz ~/habakuk'
alias sshabakuk='ssh habakuk.gmu.edu'
alias minecraft='java -Xmx1024M -Xms512M -cp minecraft.jar net.minecraft.LauncherFrame'
alias mountapenixmusic='sshfs -p 1337 Mike@apenix.homeunix.com:/mnt/bigdisc/Music ~/Music'
alias umountapenixmusic='fusermount -uz ~/Music'

# Setup Prompt

BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
NONE="\[\033[0m\]"
PURPLE="\[\033[0;35m\]"
GREEN="\[\033[0;32m\]"
PS1="${PURPLE}\h ${GREEN}[\T] ${CYAN}\W ${BLUE}\$ ${NONE}" 

# Environment Variables

export PYTHONPATH=~/aise:~/Documents/research/Masters/python:$PYTHONPATH
export PYTHONPATH=/usr/local/lib/paraview-3.8/site-packages/:$PYTHONPATH
export PYTHONPATH=/opt/visit/current/linux-x86_64/lib:$PYTHONPATH
export PYTHONPATH=~/preprocessor:$PYTHONPATH
export FIPY_VIEWER='matplotlib'
export SVN_EDITOR=vim
export EDITOR=vim
export PATH=~/aise:/usr/local/bin:$PATH
export PATH=/opt/android-sdk/platform-tools:/opt/android-sdk/tools:$PATH
export PATH=/opt/visit/bin:$PATH
export AUTO_DIR=/usr/local/auto
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
export PS3DEV=/usr/local/ps3dev
export PSL1GHT=$PS3DEV/psl1ght
export PATH=$PATH:$PSL1GHT/host/bin
export PATH=$PATH:$PS3DEV/host/ppu/bin
export PATH=$PATH:$PS3DEV/host/spu/bin
export PATH=~/preprocessor:$PATH

