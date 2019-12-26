# zsh
export DEFAULT_USER="ali"
export EDITOR=nvim
export TERM="xterm-256color"
export ZSH_CUSTOM="$HOME/Workspace/dotfiles/zsh"
export ZSH=$HOME/.oh-my-zsh
# VirtualEnvWrapper
export PROJECT_HOME="$HOME/Workspace/"
export PYTHONSTARTUP=$HOME/.pythonrc
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME="$HOME/.virtualenvs"
# Go
export GOPATH="$HOME/.bin/go"
export GLIDE_HOME="$HOME/.cache/glide"
# Theme
ZSH_THEME='dollar'
# Plugins
plugins=(
    autojump
    celery
    colored-man-pages
    command-not-found
    django
    git-prompt
    git-extras
    # helm
    kubectl
    npm
    nvm
    pyenv
    python
    # sudo
    virtualenvwrapper
)
# Path
PATHES=(
    $HOME/.local/bin
    $HOME/Workspace/dotfiles/bin
    $GOPATH/bin
    #$HOME/.gem/ruby/*/bin
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
source $HOME/Workspace/dotfiles/zsh/thirdparty/*.zsh

