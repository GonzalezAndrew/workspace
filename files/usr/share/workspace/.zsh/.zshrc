#
#   .zshrc
#
#   @author Andrew Gonzalez
#
#
export PATH=$HOME/bin:/usr/local/bin:/home/$USER/.local/bin:$PATH
export GOPATH=$HOME/go 
export PATH=$PATH:/usr/local/go/bin
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/share
export ZSH="$HOME/.oh-my-zsh"
export GOBIN="$HOME/go/bin"
export GO111MODULE="on"

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git zsh-completions)

# Source the functions directory
if [ -d ~/.functions ]; then
    for F in ~/.functions/*; do
        source $F
    done
fi

# source virtualenvwrapper
if [ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]; then
    export WORKON_HOME=~/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
    export VIRTUALENV_PYTHON="$(which python3)"
    source "$(which virtualenvwrapper.sh)"
fi


# source zsh extensions
source ~/.zsh/aliases.zsh
source ~/.zsh/completion.zsh

# source starship
eval "$(starship init zsh)"