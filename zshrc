# Zsh
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
export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/Workspace/dotfiles/virtualenvwrapper-hooks"
export WORKON_HOME="$HOME/.virtualenvs"

# Theme
ZSH_THEME='dollar/dollar'
# ZSH_THEME="random"
# ZSH_THEME="sonicradish"
# ZSH_THEME="agnoster"

# plugins
plugins=(
    autojump
    django
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
    $HOME/.config/pythonuserbase/bin/
    $HOME/.bin/android-studio/bin
    $HOME/.bin/android-sdk-linux/tools
    $HOME/.cargo/bin
    $HOME/.config/gopath/bin/
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
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
