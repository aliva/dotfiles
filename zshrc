# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM="$HOME/Workspace/dotfiles/zsh"
export DEFAULT_USER="ali"
export TERM="xterm-256color"
# powerlevel9k
export POWERLEVEL9K_MODE='awesome-fontconfig'
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=10
export POWERLEVEL9K_SHORTEN_DELIMITER="…"
export POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
export POWERLEVEL9K_PROMPT_ON_NEWLINE=true
export POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
export POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↝ "
export POWERLEVEL9K_STATUS_VERBOSE=false
if [[ $POWERLEVEL9K_MODE -eq 'awesome-fontconfig' ]]
then
    export POWERLEVEL9K_VCS_GIT_ICON=$'\UF1D3 '
    export POWERLEVEL9K_BATTERY_ICON=$'\UF242 '
    export POWERLEVEL9K_FAIL_ICON=$'\u2718'
fi
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

#ZSH_THEME="random"
#ZSH_THEME="sonicradish"
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"


# virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/Workspace/dotfiles/virtualenvwrapper-hooks"
export VIRTUALENV_PYTHON=`command -v python3`
export PROJECT_HOME="$HOME/Workspace/"
# plugins
plugins=(
    autojump
    command-not-found
    django
    git
    git-extras
    go
    golang
    mosh
    node
    npm
    python
    sudo
    pip
    vagrant
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

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export RUST_SRC_PATH=%HOME/Workspace/src/rust/src/
export PYTHONUSERBASE=$HOME/.config/pythonuserbase/
export PYTHONSTARTUP=$HOME/.pythonrc
