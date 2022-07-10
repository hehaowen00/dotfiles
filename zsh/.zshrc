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
ENABLE_CORRECTION="true"

plugins=(colored-man-pages colorize copypath git rust ripgrep)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


if [[ `uname` == "Darwin" ]] then
  alias ls="gls -v --color --group-directories-first"
fi

eval "$(pyenv init -)"

export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export GOROOT="/usr/local/go"

export PATH="$GOPATH:$GOBIN:$GOROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
