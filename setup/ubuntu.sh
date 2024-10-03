#!/bin/bash

set -e

sudo apt --yes update
# sudo apt --yes upgrade
sudo apt --yes install \
    curl \
    dconf-editor \
    flatpak \
    libfuse2 \
    fzf \
    git \
    gnome-tweaks \
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

sudo systemctl disable apport.service
