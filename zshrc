export DOTFILES="$HOME/Workspace/dotfiles/"
# zsh
export DEFAULT_USER="ali"
export EDITOR=nvim
export TERM="xterm-256color"
export ZSH_CUSTOM="$DOTFILES/zsh"
export ZSH="$HOME/.oh-my-zsh"
# VirtualEnvWrapper
export PROJECT_HOME="$HOME/Workspace/"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME="$HOME/.virtualenvs"
# Go
export GOPATH="$HOME/Workspace/go"
# npm
export NPM_PACKAGES="${HOME}/.npm-packages"
# Theme
ZSH_THEME='dollar'
# Plugins
plugins=(
  celery
  colored-man-pages
  command-not-found
  django
  fzf
  git-prompt
  git-extras
  npm
  python
  virtualenvwrapper
)
# Path
PATHES=(
    $HOME/.local/bin
    $DOTFILES/bin
    $GOPATH/bin
    $NPM_PACKAGES/bin
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
