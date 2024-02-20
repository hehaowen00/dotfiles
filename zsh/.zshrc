# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

if [[ `uname` == "Darwin" ]] then
  export ZSH="/Users/$USER/.oh-my-zsh"
fi

ZSH_THEME="murilasso"

# update automatically without asking
zstyle ':omz:update' mode auto

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(colored-man-pages colorize)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

if [[ `uname` == "Darwin" ]] then
  alias ls="gls -v --color --group-directories-first"
fi

if [[ `uname` == "Linux" ]] then
  alias ls="ls -v --color --group-directories-first"
fi

# eval "$(pyenv init -)"

export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export GOROOT="$(brew --prefix golang)/libexec"

export PATH="$GOPATH:$GOBIN:$GOROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

unsetopt correct_all
unsetopt correct

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="/usr/local/Cellar/openjdk@17/17.0.7/bin:$PATH"
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"
export PATH="$(brew --prefix openjdk@17)/bin:$PATH"
export PATH="$NVM_BIN:$PATH"
export OPENCV_INCLUDE_DIR="/opt/homebrew/Cellar/opencv/4.8.0_5/include"
export OPENCV_LIB_DIR="/opt/homebrew/Cellar/opencv/4.8.0_5/lib"
