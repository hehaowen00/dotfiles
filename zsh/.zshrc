# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

if [[ `uname` == "Darwin" ]] then
  export ZSH="/Users/$USER/.oh-my-zsh"
fi

ZSH_THEME="murilasso"

# update automatically without asking
zstyle ':omz:update' mode auto

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

if [[ `uname` == "Darwin" ]] then
  alias ls="gls -a -v --color --group-directories-first"
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH="/usr/local/Cellar/openjdk@17/17.0.7/bin:$PATH"
  export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"
  export PATH="$(brew --prefix openjdk@17)/bin:$PATH"
  export PATH="$NVM_BIN:$PATH"
  export OPENCV_INCLUDE_DIR="/opt/homebrew/Cellar/opencv/4.8.0_5/include"
  export OPENCV_LIB_DIR="/opt/homebrew/Cellar/opencv/4.8.0_5/lib"

  # fnm
  export PATH="/Users/edmundhe/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

if [[ `uname` == "Linux" ]] then
  alias ls="ls -a -v --color --group-directories-first"
fi

#export GOPATH="$HOME/go"
#export GOBIN="$HOME/go/bin"
#export GOROOT="$(brew --prefix golang)/libexec"

export PATH="$GOBIN:$PATH"

eval "$(fnm env --use-on-cd)"

