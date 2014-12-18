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

export PATH="/home/vagrant/.gem/ruby/2.1.5/bin:/usr/lib/shopify-ruby/2.1.5-shopify1/lib/ruby/gems/2.1.0/bin:/usr/lib/shopify-ruby/2.1.5-shopify1/bin:/usr/local/heroku/bin:/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/vagrant/src/golang/bin"

# Detect os
export PLATFORM=`uname`

if [[ "$PLATFORM" == "Darwin" ]]; then
  export EDITOR='mvim'
  export GOROOT=/usr/local/go
  export GOPATH=$HOME/Code/golang
  export PATH="/Users/gaurav/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/$GOPATH/bin:$PATH"
  alias vim="mvim -v"

  # for rbenv shims and autocompletion
  eval "$(rbenv init -)"
elif [[ "$PLATFORM" == "Linux" ]]; then
  export GOPATH=$HOME/src/golang
  export PATH="$PATH:$GOPATH/bin"
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
alias pc="be pry -r ./config/environment"
alias tmcc="tmux -CC attach"
alias tmnew="tmux new-session -s vagrant"

# Funcs

## open gem inside vim
function bo {
  local gem_path=`bundle show "$1"`
  vim +":cd $gem_path"
}

export LOG_LEVEL=debug

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Fix for SSH forwarding to reattached tmux session
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;
