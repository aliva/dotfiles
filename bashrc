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
# on some systems caused slow autocompletion or hanging session
# export CDPATH=$CDPATH:$HOME/Workspace:$HOME
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
# other {{{
any(){
    # http://www.commandlinefu.com/commands/view/13950
    ps aux | grep -E "[${1:0:1}]${1:1}|^USER";
}
alias r="source ~/.bashrc && reset"
alias info="info --vi-keys"
alias q="exit"
alias serve_dir="python3 -m http.server"
alias cb="xclip -selection clipboard"
alias random_string="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1"
# }}}
# ack {{{
alias ack="ack-grep"
# }}}
# apt {{{
# if apt-fast is installed prefer apt-fast for downloading packages
#if command -v apt-fast > /dev/null; then APT_CMD=apt-fast; else APT_CMD=apt-get; fi
APT_CMD=apt-get
alias apt-get="sudo apt-get"
alias apt="apt-get"
alias apti="sudo $APT_CMD install"
alias apty="sudo $APT_CMD update"
alias aptu="sudo $APT_CMD upgrade"
alias aptdu="sudo $APT_CMD dist-upgrade"
alias apts="apt-cache search"
# }}}
# dd {{{
alias dd_status="sudo kill -USR1 $(pgrep ^dd)"
# }}}
# docker {{{
alias docker="sudo docker"
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
# git {{{
alias gd="git diff"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gs="git status"
alias gps="git push"
alias gpl="git pull"
alias gitg="gitg &>/dev/null"
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
# internet {{{
alias myip="curl -s icanhazip.com"
alias p8="ping 8.8.8.8 -i 3"
alias axel="axel -a -n 50"
alias wget="wget -c"
alias aria2c="aria2c --dir=$HOME/Downloads/aria2c"
alias tor="tor -f $HOME/.torrc"
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
alias cdt="cd /tmp"
alias cdw="cd ~/Workspace"
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
alias poweroff="sudo poweroff -p"
alias reboot="sudo reboot"
alias service="sudo service"
alias systemctl="sudo systemctl"
alias swapflush="echo swapoff && sudo swapoff -a && echo swapon && sudo swapon -a && echo done"
alias update-rc.d="sudo update-rc.d"
alias supervisorctl="sudo supervisorctl"
# }}}
# vim {{{
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

    # other
    if [ -f $HOME/.local/etc/bash_completion.d/youtube-dl.bash-completion ]
    then
        source $HOME/.local/etc/bash_completion.d/youtube-dl.bash-completion
    fi

    # in repo
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
    # never used autojump
    #autojump_add_to_database &>/dev/null

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
        PS1="${Cyan}↝ ${Green}\w \n${Cyan}$PROMPT ${GREEN}"
    fi
}
#PS1='\[\033[00;36m\]↝ \[\033[00;33m\]\w \n\[\033[00;36m\]✎ \[\033[00m\]'
# this chars are also good for prompt: ↳↪↝✎
PROMPT_COMMAND=bash_prompt_command
# }}}
# local bashrc {{{
if [[ -f ~/Workspace/dotfiles/bashrc.local ]]
then
    source ~/Workspace/dotfiles/bashrc.local
fi
# }}}
