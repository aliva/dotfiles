#!/bin/bash

set -e

sudo apt --yes update
# sudo apt --yes upgrade
sudo apt --yes install \
    curl \
    fzf \
    git \
    gpaste-2 \
    neovim \
    pipx \
    solaar \
    terminator \
    tmux \
    ubuntu-gnome-desktop \
    virtualenvwrapper \
    zsh \
    zsh-autosuggestions
