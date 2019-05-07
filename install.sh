#!/bin/bash

export DOTFILES=$HOME/Workspace/dotfiles

curl -fLo $DOTFILES/nvim/autoload/vim.plug --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
