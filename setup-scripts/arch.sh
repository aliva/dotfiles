#!/bin/bash

# Arch Linux setup script
# Installs essential packages for development and daily use

set -euo pipefail

if ! command -v pacman &> /dev/null; then
    echo "This script must be run on Arch Linux (pacman not found)." >&2
    exit 1
fi

sudo pacman -Sy --needed \
    fzf \
    git \
    gst-plugins-ugly \
    lib32-vulkan-radeon \
    mise \
    obsidian \
    python-virtualenvwrapper \
    rustup \
    solaar \
    starship \
    steam \
    telegram-desktop \
    terminator \
    ttf-firacode-nerd \
    vlc \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting

echo "Done!"
