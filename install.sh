#!/bin/bash

export DOTFILES=$HOME/Workspace/dotfiles

curl -fLo $DOTFILES/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
