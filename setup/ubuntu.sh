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
    gnome-shell-extension-gpaste \
    gnome-tweaks \
    gpaste-2 \
    neovim \
    pipx \
    python3-pip \
    python-is-python3 \
    solaar \
    terminator \
    tmux \
    ubuntu-gnome-desktop \
    virtualenvwrapper \
    zsh \
    zsh-autosuggestions

sudo apt --yes purge "apport*"
