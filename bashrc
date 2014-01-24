#!/bin/bash

# store dotfiles path an a variable, for late uses
DOTFILES=~/Workspace/dotfiles

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
HISTSIZE=1000
HISTFILESIZE=2000

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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# end of ubuntu default crap }}}
# alias {{{
alias r="source ~/.bashrc && reset"
alias q="exit"
# python
alias p="python"
alias p2="python2"
alias p3="python3"
# sudo
alias s="sudo"
alias poweroff="sudo poweroff -p"
alias reboot="sudo reboot"
# apt
alias apt="sudo apt-get"
alias apt-get="sudo apt-get"
alias apti="sudo apt-get install"
alias apty="sudo apt-get update"
alias aptu="sudo apt-get upgrade"
alias aptdu="sudo apt-get dist-upgrade"
alias apts="apt-cache search"
# path
alias c="cd"
alias ..="cd .."
alias cdb="cd ~/bin"
alias cdd="cd ~/Workspace/dotfiles"
alias cdw="cd ~/Workspace"
alias mkdir="mkdir -pv"
# internet
alias p8="ping 8.8.8.8"
alias axel="axel -a -n 40"
# tuneling,
alias tun="ssh a 'echo Connected! && cat'"
# }}}
# completion files in dotfile {{{
for f in $DOTFILES/bash-completion/*.sh
do
    source $f
done
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
    # pwd
    pth=`pwd | sed -e "s|^$HOME|~|"`
    # free space on current line of terminal
    num=`expr $(tput cols) - ${#pth} - 3 - 5`
    
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
        PS1="${CYAN}↝ ${YELLOW}${pth} ${space} ${CYAN}${ret} \n${CYAN}✎ ${NO_COLOR}"
    else
        PS1="${CYAN}↝ ${YELLOW}\w \n${CYAN}✎ ${NO_COLOR}"
    fi
}
#PS1='\[\033[00;36m\]↝ \[\033[00;33m\]\w \n\[\033[00;36m\]✎ \[\033[00m\]'
# this chars are also good for prompt: ↳↪ 
PROMPT_COMMAND=bash_prompt_command
# }}}
