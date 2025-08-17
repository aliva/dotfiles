export DOTFILES="$HOME/Workspace/dotfiles/"

# zsh
export DEFAULT_USER="ali"
export EDITOR="nvim"
export TERM="xterm-256color"
export ZSH_CUSTOM="$DOTFILES/zsh"
export ZSH="$HOME/.oh-my-zsh"
export DISABLE_UPDATE_PROMPT=true

# VirtualEnvWrapper
export PROJECT_HOME="$HOME/Workspace/"
export VIRTUALENVWRAPPER_PYTHON=$(which python3)  # More portable than hardcoding /usr/bin/python3
export WORKON_HOME="$HOME/.virtualenvs"

# Theme
ZSH_THEME='dollar'

# Plugins
plugins=(
  colored-man-pages
  command-not-found
  fzf
  git
  git-extras
  mise
  # git-prompt  # used in dollar theme
  kubectl
  # kube-ps1    # used in dollar theme
  python
  starship
  virtualenvwrapper
)

# Load init files
for f in $DOTFILES/zsh/init/*.zsh
do
   source $f
done

if [ -f $DOTFILES/zsh/local.zsh ]
then
  source $DOTFILES/zsh/local.zsh
fi

# load omz
source $ZSH/oh-my-zsh.sh
