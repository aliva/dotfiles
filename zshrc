# zsh
export DEFAULT_USER="ali"
export EDITOR=vim
export TERM="xterm-256color"
export ZSH_CUSTOM="$HOME/Workspace/dotfiles/zsh"
export ZSH=$HOME/.oh-my-zsh
# VirtualEnvWrapper
export PROJECT_HOME="$HOME/Workspace/"
export PYTHONSTARTUP=$HOME/.pythonrc
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME="$HOME/.virtualenvs"
# Go
export GOPATH="$PROJECT_HOME/go"
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
    #pyenv
    python
    sudo
    virtualenvwrapper
)
# Path
PATHES=(
    $HOME/.local/bin
    $HOME/Workspace/dotfiles/bin
    $GOPATH/bin
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

if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]
then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'
fi

