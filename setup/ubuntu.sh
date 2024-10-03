#!/bin/bash

set -e

sudo apt --yes update
# sudo apt --yes upgrade
sudo apt --yes install \
    curl \
    dconf-editor \
    flatpak \
    fzf \
    git \
    gnome-tweaks \
    gpaste-2 \
    neovim \
    pipx \
    python3-pip \
    solaar \
    terminator \
    tmux \
    ubuntu-gnome-desktop \
    virtualenvwrapper \
    zsh \
    zsh-autosuggestions

sudo apt --yes purge "apport*"
