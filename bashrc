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
alias any="ps -ef | grep -v grep | grep -i"
alias dots="vim +:Explore ~/Workspace/dotfiles"
alias r="source ~/.bashrc && reset"
alias info="info --vi-keys"
alias o="xdg-open"
alias q="exit"
alias countfiles="ls -l | wc -l"
# }}}
# ack {{{
if command -v ack-grep >/dev/null
then
    alias ack="ack-grep"
fi
# }}}
# apt {{{
# if apt-fast is installed prefer apt-fast for downloading packages
if command -v apt-fast > /dev/null; then APT_CMD=apt-fast; else APT_CMD=apt-get; fi
alias apt="sudo apt-get"
alias apt-get="sudo $APT_CMD"
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
if command -v docker.io >/dev/null; then
    alias docker="docker.io"
fi
if command -v docker >/dev/null; then
    alias docker="sudo docker"
    alias di="docker images"
    alias dl="docker ps -lq"
    alias dps="docker ps"
    alias drm="docker rm"
    alias drmi="docker rmi"
    alias docker_remove_untagged_images="docker images -q --filter 'dangling=true' | xargs sudo docker rmi"
    function dip(){
        if [ -z $1 ]
        then
            docker inspect --format '{{ .NetworkSettings.IPAddress }}' `docker ps -lq`
        else
            docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1
        fi
    }

    complete -o default -o nospace -F _docker docker
fi
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
alias "get-pip"="echo https://bootstrap.pypa.io/get-pip.py"
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
# vim {{{
gvim(){
    command gvim --remote-tab-silent "$@" || command gvim "$@"
}
# }}}
# }}}
# auto jump {{{
if [ -f /usr/share/autojump/autojump.sh ]
then
    . /usr/share/autojump/autojump.sh
fi
# }}}
# completion files and scripts {{{
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi

    if [ -d ~/Workspace/dotfiles ]
    then
        for f in ~/Workspace/dotfiles/bash-scripts/*.bash
        do
            source $f
        done
    fi
fi
# }}}
# prompt {{{
git_get_status(){
    STATUS=""
    INDEX=$(timeout 0.5s git status --porcelain 2> /dev/null)

    if [[ $? -ne 0 ]]
    then
        return
    fi

    if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
        STATUS="C$STATUS"
    fi

    if $(echo "$INDEX" | grep '^.[MD] ' &> /dev/null); then
        STATUS="?$STATUS"
    elif $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
        STATUS="?$STATUS"
    fi

    if $(echo "$INDEX" | grep '^[AMDR]. ' &> /dev/null); then
        STATUS="!$STATUS"
    fi

    if `timeout 0.5 git status | head -n 2 | tail -n 1 | grep ahead &>/dev/null`
    then
        STATUS="↑$STATUS"
    fi

    echo -n $STATUS
}
git_get_branch(){
    gitsym=`timeout 0.5s git symbolic-ref HEAD 2>/dev/null`
    branch="${gitsym##refs/heads/}"
    echo -n $branch
}
bash_prompt_command() {
    # last command return value
    ret=$?

    # autojump update db
    autojump_add_to_database &>/dev/null

    # if root
    if [[ $EUID -ne 0 ]]
    then
        # not root
        PROMPT="✎"
        PROMPT_COLOR=$Cyan
    else
        # root
        PROMPT="#"
        PROMPT_COLOR=$Red
    fi

    # if connected through ssh
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]
    then
        host_color=$Red
    else
        host_color=$Yellow
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
    venv=""
    if [[ $VIRTUAL_ENV != "" ]]
    then
        # Strip out the path and just leave the env name
        venv="(${VIRTUAL_ENV##*/})"
    fi

    git_status=`git_get_status`
    git_branch=`git_get_branch`

    # how many spaces should I print?
    num=`expr $(tput cols) - ${#user} - ${#host} - ${#pth} - ${#venv} - ${#music} - ${#git_status} - ${#git_branch} - 18`

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
        PS1="${PROMPT_COLOR}${user} ${White}at ${host_color}$host ${White}in ${Green}${pth}${Blue}${venv}"
        if [ ! -z $git_branch ]
        then
            PS1=$PS1" ${White}on ${Magenta}${git_branch}${git_status}"
        fi
        PS1=$PS1"${space} ${music} ${PROMPT_COLOR}${ret} \n${PROMPT_COLOR}$PROMPT ${White}"
    else
        PS1="${PROMPT_COLOR}↝ ${YELLOW}\w \n${PROMPT_COLOR}$PROMPT ${GREEN}"
    fi
}
#PS1='\[\033[00;36m\]↝ \[\033[00;33m\]\w \n\[\033[00;36m\]✎ \[\033[00m\]'
# this chars are also good for prompt: ↳↪↝✎
PROMPT_COMMAND=bash_prompt_command
# }}}
