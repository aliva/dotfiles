#!/bin/bash

# bash configs
# If not running interactively, don't do anything
case $- in *i*) ;; *) return ;; esac

if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=$HISTSIZE
export EDITOR=vim

# append to the history file, don't overwrite it
shopt -s histappend
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls="LC_ALL=en_US.UTF-8 ls --color=auto"
alias ~="cd ~"
alias ..="cd .."

# added by travis gem
[ -f /home/ali/.travis/travis.sh ] && source /home/ali/.travis/travis.sh
