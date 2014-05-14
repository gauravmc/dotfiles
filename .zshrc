# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Detect os
export PLATFORM=`uname`

if [[ "$PLATFORM" == "Darwin" ]]; then
  export PATH="/Users/gaurav/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin"
  export EDITOR='mvim'
  alias vim="mvim -v"
elif [[ "$PLATFORM" == "Linux" ]]; then
  export EDITOR='vim'
fi

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Aliases
alias be="bundle exec"
alias gl="git log --date=short --pretty=format:'%Cgreen%h %Cblue%cd %Cred%an%Creset: %s'"
alias gdc="git diff --cached"
alias ga="git add -A"
alias gc="git commit"
alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias spt="be spring testunit"
alias sp="be spring"
alias to="script/testonly"

# go lang
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go
export GOPATH=$HOME/Code/go
export LOG_LEVEL=debug

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

export LOG_LEVEL=debug
