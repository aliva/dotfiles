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

for f in $DOTFILES/zsh/init/*.zsh; do
   source $f
done

source $ZSH/oh-my-zsh.sh

