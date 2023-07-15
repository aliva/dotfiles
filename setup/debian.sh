#!/bin/bash

sudo apt update
sudo apt install --yes \
    curl \
    fzf \
    git \
    neovim \
    thunderbird \
    virtualenvwrapper \
    zsh

if [ ! -d $HOME/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo oh-my-zsh already installed, skip.
fi
