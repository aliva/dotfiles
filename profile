#!/bin/bash
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

BIN_PATHES="$HOME/.local/bin
$HOME/Workspace/dotfiles/bin
$HOME/bin/android-sdk-linux/tools
$HOME/bin/android-studio/bin
$HOME/bin/genymotion
$HOME/pypy/bin
$HOME/pypy3/bin"

for p in $BIN_PATHES
do
    PATH="$PATH:$p"
done
