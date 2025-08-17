#!/bin/bash

# If not running interactively, don't do anything
case $- in *i*) ;; *) return ;; esac

if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000
export EDITOR=nvim

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
