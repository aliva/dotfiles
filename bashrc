#!/bin/bash

# bash configs {{{
# If not running interactively, don't do anything
case $- in *i*) ;; *) return;; esac

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth
# no limit!
export HISTSIZE=-1
export HISTFILESIZE=$HISTSIZE
# cdpath
export CDPATH=$CDPATH:$HOME/Workspace:$HOME
# I kinda like vim
export EDITOR=vim
# I had some conflicts while system locale was fa_IR
#export LANG=en_US.utf8
#export LC_ALL=$LANG

# append to the history file, don't overwrite it
shopt -s histappend
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# }}}
# alias and functions {{{
# what {{{
alias dots="vim +:Explore ~/Workspace/dotfiles"
alias r="source ~/.bashrc && reset"
alias info="info --vi-keys"
alias o="xdg-open"
alias q="exit"
alias countfiles="ls -l | wc -l"
# }}}
# apt {{{
# if apt-fast is installed prefer apt-fast for downloading packages
if command -v apt-fast > /dev/null; then APT_CMD=apt-fast; else APT_CMD=apt-get; fi
alias apt="sudo apt-get"
alias apt-get="sudo apt-get"
alias apti="sudo $APT_CMD install"
alias apty="sudo $APT_CMD update"
alias aptu="sudo $APT_CMD upgrade"
alias aptdu="sudo $APT_CMD dist-upgrade"
alias apts="apt-cache search"
# }}}
# date {{{
alias ymd="date +%Y-%m-%d"
# }}}
# docker {{{
alias docker="sudo docker"
complete -o default -o nospace -F _docker docker
alias ducker="docker"
complete -o default -o nospace -F _docker ducker
alias dl="docker ps -lq"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
function dipl(){
    docker inspect --format '{{ .NetworkSettings.IPAddress }}' `docker ps -lq`
}
function drml(){
    docker ps -l
    docker rm -f $(dl)
}
# }}}
# git {{{
alias gd="git diff"
alias gc="git commit -m"
alias gs="git status"
alias gitg="gitg &>/dev/null"
# }}}
# grep {{{
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# }}}
# hg {{{
alias h="hg"
complete -o default -o nospace -F _hg h
alias ha="hg add"
alias hc="hg commit -m"
alias hd="hg diff"
alias hp="hg push"
alias hs="hg status"
# }}}
# internet {{{
alias myip="curl -s icanhazip.com"
alias tor="tor -f ~/Workspace/dotfiles/torrc"
alias p8="ping 8.8.8.8"
alias axel="axel -a -n 50"
alias wget="wget -c"
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
alias cdd="cd ~/Workspace/dotfiles"
alias cdn="cd ~/Workspace/notes"
alias cdt="cd /tmp"
alias cdw="cd ~/Workspace"
alias mkdir="mkdir -p"
# }}}
# python {{{
alias p2="python2"
alias p3="python3"
complete -o default -F _pip pip3
complete -o default -F _pip pip2
# }}}
# sudo {{{
alias sudo="sudo -E"
alias s="sudo"
complete -o default -o nospace -F _root_command s
alias poweroff="sudo poweroff -p"
alias reboot="sudo reboot"
alias service="sudo service"
alias systemctl="sudo systemctl"
alias swapflush="echo swapoff && sudo swapoff -a && echo swapon && sudo swapon -a && echo done"
alias update-rc.d="sudo update-rc.d"
# }}}
# tunel {{{
alias tun="ssh a 'echo Connected to a! && cat'"
alias tuna="ssh a 'echo Connected to a! && cat'"
alias tunv="ssh v 'echo Connected to v! && cat'"
# }}}
# }}}
# auto jump {{{
if [ -f /usr/share/autojump/autojump.sh ]
then
    . /usr/share/autojump/autojump.sh
fi
# }}}
# completion files {{{
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi

    if [ -d ~/Workspace/dotfiles ]
    then
        for f in ~/Workspace/dotfiles/bash-completion/*.bash
        do
            source $f
        done
    fi
fi
# }}}
# prompt {{{
# colors {{{
NO_COLOR="\[\033[00m\]"
BLACK="\[\033[0;30m\]"
BLACKBOLD="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
REDBOLD="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
GREENBOLD="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
YELLOWBOLD="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BLUEBOLD="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PURPLEBOLD="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
CYANBOLD="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
WHITEBOLD="\[\033[1;37m\]"
# }}}
function bash_prompt_command {
    # last command return value
    ret=$?

    # autojump update db
    autojump_add_to_database &>/dev/null

    # if root
    if [[ $EUID -ne 0 ]]
    then
        # not root
        PROMPT="$"
        PROMPT_COLOR=$CYAN
    else
        # root
        PROMPT="#"
        PROMPT_COLOR=$RED
    fi

    # if connected through ssh
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]
    then
        # if connected through ssh
        host_color=$RED
    else
        # if not
        host_color=$YELLOW
    fi

    # media player info
    #music=`timeout 1 mediaplayer-remote info 2>/dev/null | sed -e "s/^.*: //g" | sed -e "/^$/d" | sed -e ':a;N;$!ba;s/\n/ - /g'`
    #music=`timeout 1 mediaplayer-remote info 2>/dev/null`

    # current user
    user=$USER

    # hostname of current system
    host=$HOSTNAME

    # pwd
    pth=`pwd | sed -e "s|^$HOME\/|~\/|"`
    if [[ $pth = $HOME ]]
    then
       pth="~"
    fi

    # if vurtualenv
    if [[ $VIRTUAL_ENV != "" ]]
    then
        # Strip out the path and just leave the env name
        venv="(${VIRTUAL_ENV##*/}) "
    else
        # In case you don't have one activated
        venv=""
    fi

    # how many spaces should I print?
    num=`expr $(tput cols) - ${#user} - ${#host} - ${#pth} - ${#venv} - ${#music} - 16`

    # if there is space in current line to show last commands ret code
    if [[ $num -gt 0 ]]; then
        # if return code is zero instead of -zero- print :)
        if [[ $ret -eq 0 ]]; then
            ret="   " # " :)"
        # if return code is no zero print it - right aligned
        else
            ret=`printf '%3d' $ret`
        fi
        # somespaces between $pth and $ret
        space=`printf ' %.0s' $(seq 1 $num)`
        PS1="${PROMPT_COLOR}${user} ${WHITE}at ${host_color}$host ${WHITE}in ${GREEN}${pth} ${WHITEBOLD}${venv} ${space} ${music} ${PROMPT_COLOR}${ret} \n${PROMPT_COLOR}$PROMPT ${WHITE}"
    else
        PS1="${PROMPT_COLOR}↝ ${YELLOW}\w \n${PROMPT_COLOR}$PROMPT ${GREEN}"
    fi
}
#PS1='\[\033[00;36m\]↝ \[\033[00;33m\]\w \n\[\033[00;36m\]✎ \[\033[00m\]'
# this chars are also good for prompt: ↳↪↝✎
PROMPT_COMMAND=bash_prompt_command
# }}}
