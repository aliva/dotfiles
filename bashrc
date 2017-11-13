#!/bin/bash

# bash configs {{{
# If not running interactively, don't do anything
case $- in *i*) ;; *) return;; esac

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=$HISTSIZE
# cdpath
# on some systems caused slow autocompletion or hanging session
# export CDPATH=$CDPATH:$HOME/Workspace:$HOME
# I kinda like vim
export EDITOR=vim

# append to the history file, don't overwrite it
shopt -s histappend
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# }}}
# alias and functions {{{
# other {{{
alias r="source ~/.bashrc && reset"
alias info="info --vi-keys"
alias serve_dir="python3 -m http.server"
alias cb="xclip -selection clipboard"
# }}}
# ack
alias ack="ack-grep"
# dd {{{
alias dd_status="sudo kill -USR1 $(pgrep ^dd)"
# }}}
# docker {{{
alias di="docker images"
alias dps="docker ps"
alias drm="docker rm"
alias drmi="docker rmi"
alias docker_remove_untagged_images="docker images -q --filter 'dangling=true' | xargs sudo docker rmi"
function dip(){
    if [ -z $1 ]
    then
        sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' `docker ps -lq`
    else
        sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1
    fi
}
# }}}
# grep {{{
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# }}}
# hg {{{
alias h="hg"
alias ha="hg add"
alias hc="hg commit -m"
alias hd="hg diff"
alias hp="hg push"
alias hs="hg status"
# }}}
# kill {{{
alias kilall="killall"
# }}}
# less {{{
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# }}}
# ls {{{
alias ls="LC_ALL=en_US.UTF-8 ls --color=auto"
alias sl="ls"
# http://www.reddit.com/r/linux/comments/23zibr/hey_reddit_linux_users_what_are_your_best_shell/ch25z3r
alias ll="ls -lAhF --color | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
alias la='ls -A'
alias l='ls -CF'
# }}}
# path {{{
alias ~="cd ~"
alias ..="cd .."
alias mkdir="mkdir -p"
# }}}
# python {{{
alias p2="python2"
alias p3="python3"
alias "get-pip"="echo https://bootstrap.pypa.io/get-pip.py"
# }}}
# sudo {{{
alias sudo="sudo -E"
alias s="sudo"
complete -o default -o nospace -F _root_command s
alias swapflush="echo swapoff && sudo swapoff -a && echo swapon && sudo swapon -a && echo done"
# }}}
# virtualenvwrapper {{{
#export WORKON_HOME=$HOME/.config/virtualenvs
export PROJECT_HOME=$HOME/Workspace
export VIRTUALENVWRAPPER_WORKON_CD=1
export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/Workspace/dotfiles/virtualenvwrapper-hooks"
export VIRTUALENV_PYTHON=`command -v python3`
alias lsvirtualenv="lsvirtualenv -b"
# }}}
# wine {{{
#export WINEPREFIX=$HOME/.config/wine/
export WINEARCH=win32
# }}}
# }}}
# completion files and scripts {{{
if ! shopt -oq posix; then
    # global
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi
fi
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# }}}
# local bashrc {{{
if [[ -f ~/Workspace/dotfiles/bashrc.local ]]
then
    source ~/Workspace/dotfiles/bashrc.local
fi
# }}}
