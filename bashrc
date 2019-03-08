set -o vi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh 
# User specific aliases and functions

alias vim=nvim
alias vi=nvim
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias newterm='urxvt &>/dev/null &'
alias shutitdown='sudo shutdown -hP now'
alias minecraft='java -Xmx1024M -Xms512M -cp minecraft.jar net.minecraft.LauncherFrame'

# Setup Prompt

BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
NONE="\[\033[0m\]"
PURPLE="\[\033[0;35m\]"
GREEN="\[\033[0;32m\]"
PS1="${PURPLE}$(scutil --get ComputerName)${GREEN}\$(__git_ps1) ${CYAN}\W ${BLUE}\$ ${NONE}" 

# Environment Variables

export PYTHONPATH=~/aise:~/Documents/research/Masters/python:$PYTHONPATH
export PYTHONPATH=/usr/local/lib/paraview-3.8/site-packages/:$PYTHONPATH
export PYTHONPATH=/opt/visit/current/linux-x86_64/lib:$PYTHONPATH
export PYTHONPATH=~/preprocessor:$PYTHONPATH
export FIPY_VIEWER='matplotlib'
export SVN_EDITOR=nvim
export EDITOR=nvim
export PATH=~/aise:/usr/local/bin:$PATH
export PATH=/opt/android-sdk/platform-tools:/opt/android-sdk/tools:$PATH
export PATH=/opt/visit/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export AUTO_DIR=/usr/local/auto
export LESS=' -R '
export PS3DEV=/usr/local/ps3dev
export PSL1GHT=$PS3DEV/psl1ght
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$PSL1GHT/host/bin
export PATH=$PATH:$PS3DEV/host/ppu/bin
export PATH=$PATH:$PS3DEV/host/spu/bin
export PATH=~/preprocessor:$PATH
export PATH=$PATH:/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources
export PATH=$PATH:/usr/local/Cellar/ruby/2.0.0-p247/bin
export PATH="./bin:./node_modules/.bin:$PATH"
export RUN_ON_HOST=*
export NODE_REPL_HISTORY_FILE="$HOME/.node-repl-hist"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
export NPM_TOKEN="15f9cdaa-86a3-43bb-ba69-f4595acc0a35"
export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"

#Python virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7  # assuming a 'brew install python'
source /usr/local/bin/virtualenvwrapper.sh

#Go stuff
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/.gvm/bin:$PATH"
launchctl setenv GOPATH $GOPATH
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
source /usr/local/opt/autoenv/activate.sh

source ~/.private_bashrc

alias mastodon='mastodon -k sdk-80e27131-2e76-4630-bd07-3490ee055398 -a api-7e3b2b57-87ba-4d34-a627-621349522366'
alias nf='xargs -J % notify -title done -text %'

ulimit -n 5000
