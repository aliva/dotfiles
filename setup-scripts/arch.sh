#!/bin/bash

# Arch Linux setup script
# Installs essential packages for development and daily use

set -euo pipefail

if ! command -v pacman &> /dev/null; then
    echo "This script must be run on Arch Linux (pacman not found)." >&2
    exit 1
fi

sudo pacman -Suy --needed \
    deskflow \
    docker \
    docker-compose \
    fzf \
    git \
    gitg \
    gnome-browser-connector \
    gnome-shell-extensions \
    gpaste \
    gst-plugins-ugly \
    lib32-vulkan-radeon \
    mise \
    obsidian \
    python-virtualenvwrapper \
    reflector \
    rustup \
    solaar \
    starship \
    steam \
    telegram-desktop \
    terminator \
    ttf-dejavu \
    ttf-firacode-nerd \
    ttf-roboto \
    vlc \
    vlc-plugins-all \
    wl-clipboard \
    yt-dlp \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    ;

echo "Done!"
