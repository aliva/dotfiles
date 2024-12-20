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
    rofi \
    solaar \
    sway \
    terminator \
    tmux \
    ubuntu-gnome-desktop \
    virtualenvwrapper \
    vlc \
    waybar \
    wob \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting

sudo apt --yes purge "apport*"
