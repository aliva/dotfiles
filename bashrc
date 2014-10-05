#!/bin/bash

# vars {{{
export CDPATH=$CDPATH:$HOME/Workspace:$HOME
export EDITOR=vim
#export LANG=en_US.utf8
#export LC_ALL=$LANG
# }}}
#TODO: check this section: ubuntu default crap {{{
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in *i*) ;; *) return;; esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# end of ubuntu default crap }}}
# auto jump {{{
if [ -f /usr/share/autojump/autojump.sh ]
then
    . /usr/share/autojump/autojump.sh
fi
# }}}
# alias {{{
alias dots="vim +:Explore ~/Workspace/dotfiles"
alias r="source ~/.bashrc && reset"
alias info="info --vi-keys"
alias o="xdg-open"
alias q="exit"
alias :q="exit"
alias ,q="exit"
# docker
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
#alias docker-rm-all="docker stop $(docker ps -aq) && docker rm $(docker ps -aq)"
# python
alias p2="python2"
alias p3="python3"
complete -o default -F _pip pip3
complete -o default -F _pip pip2
# sudo
alias sudo="sudo -E"
alias s="sudo"
complete -o default -o nospace -F _root_command s
alias poweroff="sudo poweroff -p"
alias reboot="sudo reboot"
alias service="sudo service"
alias systemctl="sudo systemctl"
alias swapflush="echo swapoff && sudo swapoff -a && echo swapon && sudo swapon -a && echo done"
alias update-rc.d="sudo update-rc.d"
# apt, if apt-fast is installed prefer apt-fast for downloading packages
if command -v apt-fast > /dev/null; then APT_CMD=apt-fast; else APT_CMD=apt-get; fi
alias apt="sudo apt-get"
alias apt-get="sudo apt-get"
alias apti="sudo $APT_CMD install"
alias apty="sudo $APT_CMD update"
alias aptu="sudo $APT_CMD upgrade"
alias aptdu="sudo $APT_CMD dist-upgrade"
alias apts="apt-cache search"
# pacman
function pacman(){
#    if echo $1 | grep "^\-.*S" &>/dev/null && [[ $1 != "-Ss" ]]
#    then
#        has_sudo="sudo"
#    else
#        has_sudo=
#    fi
    LANG=en_US.utf-8 /usr/bin/pacman $@
}
# path
alias ~="cd ~"
alias ..="cd .."
alias cdd="cd ~/Workspace/dotfiles"
alias cdn="cd ~/Workspace/notes"
alias cdt="cd /tmp"
alias cdw="cd ~/Workspace"
alias mkdir="mkdir -p"
alias countfiles="ls -l | wc -l"
# internet
alias myip="curl -s icanhazip.com"
alias tor="tor -f ~/Workspace/dotfiles/torrc"
alias p8="ping 8.8.8.8"
alias axel="axel -a -n 50"
alias wget="wget -c"
# tuneling,
alias tun="ssh a 'echo Connected to a! && cat'"
alias tuna="ssh a 'echo Connected to a! && cat'"
alias tunv="ssh v 'echo Connected to v! && cat'"
# date
alias ymd="date +%Y-%m-%d"
# hg
alias h="hg"
complete -o default -o nospace -F _hg h
alias ha="hg add"
alias hc="hg commit -m"
alias hd="hg diff"
alias hp="hg push"
alias hs="hg status"
# doge
# http://www.reddit.com/r/linux/comments/23zibr/hey_reddit_linux_users_what_are_your_best_shell/ch265hi
alias such="hg"
alias very="hg"
alias wow="hg status"
complete -o default -o nospace -F _hg such
complete -o default -o nospace -F _hg very
complete -o default -o nospace -F _hg_status wow
# ls
alias ls="LC_ALL=en_US.UTF-8 ls --color=auto"
alias sl="ls"
# http://www.reddit.com/r/linux/comments/23zibr/hey_reddit_linux_users_what_are_your_best_shell/ch25z3r
alias ll="ls -lAhF --color | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
alias la='ls -A'
alias l='ls -CF'
# mp3
alias id3ren="id3ren -template='%a - %s.mp3'"
alias lltag="lltag -F '%a-%t' --sep _"
# kill
alias kilall="killall"
# }}}
# completion files in dotfile {{{
if [ -d ~/Workspace/dotfiles ]
then
    for f in ~/Workspace/dotfiles/bash-completion/*.bash
    do
        source $f
    done
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
    music=`timeout 1 mediaplayer-remote info 2>/dev/null`

    # current user
    user=`whoami`

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
