export DOTFILES="$HOME/Workspace/dotfiles/"
# zsh
export DEFAULT_USER="ali"
export EDITOR=nvim
export TERM="xterm-256color"
export ZSH_CUSTOM="$DOTFILES/zsh"
export ZSH="$HOME/.oh-my-zsh"
export DISABLE_UPDATE_PROMPT=true
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
  fzf
  git-prompt
  git-extras
  npm
  pyenv
  python
  virtualenvwrapper
)
# Path
PATHES=(
  $HOME/.local/bin
  $DOTFILES/bin
  $HOME/.cargo/bin
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
  if [ -d $p ]
  then
    if [ -z $PATH ]
    then
      PATH=$p
    else
      PATH="$PATH:$p"
    fi
  fi
done
unset PATHES p
export PATH

if [ -x "$(command -v pyenv)" ]
then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

source $ZSH/oh-my-zsh.sh

