# zsh
export DEFAULT_USER="ali"
export EDITOR=vim
export TERM="xterm-256color"
export ZSH_CUSTOM="$HOME/Workspace/dotfiles/zsh"
export ZSH=$HOME/.oh-my-zsh

# virtualenvwrapper
export PROJECT_HOME="$HOME/Workspace/"
export PYTHONSTARTUP=$HOME/.pythonrc
export PYTHONUSERBASE=$HOME/.config/pythonuserbase/
export VIRTUALENV_PYTHON=`command -v python3`
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/Workspace/dotfiles/virtualenvwrapper-hooks"
export WORKON_HOME="$HOME/.virtualenvs"

# go
export GOPATH="$HOME/.config/go-lang/"

# Theme
ZSH_THEME='dollar/dollar'
# ZSH_THEME="random"
# ZSH_THEME="sonicradish"
# ZSH_THEME="agnoster"

# plugins
plugins=(
    autojump
    command-not-found
    django
    dnf
    git
    mosh
    npm
    python
    sudo
    pip
    virtualenvwrapper
    # custom plugins
    zsh-autosuggestions
)


PATHES=(
    $HOME/.local/bin
    $HOME/Workspace/dotfiles/bin
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /usr/bin/vendor_perl
    /sbin
    /bin
    /usr/games
    /usr/local/games
)
unset PATH
for p in $PATHES
do
    PATH="$PATH:$p"
done
export PATH
unset PATHES

source $ZSH/oh-my-zsh.sh
