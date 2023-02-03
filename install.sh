#!/bin/bash

set -e

export DOTFILES=$HOME/Workspace/dotfiles

rm -rf $HOME/.config/Code/User
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/sway
rm -rf $HOME/.config/waybar

mkdir -p $HOME/.aria2/
mkdir -p $HOME/.config/
mkdir -p $HOME/.config/Code/

ln -sf $DOTFILES/ackrc          $HOME/.ackrc
ln -sf $DOTFILES/aria2.conf     $HOME/.aria2/aria2.conf
ln -sf $DOTFILES/bashrc         $HOME/.bashrc
ln -sf $DOTFILES/editorconfig   $HOME/.editorconfig
ln -sf $DOTFILES/flake8         $HOME/.config/flake8
ln -sf $DOTFILES/gitconfig      $HOME/.gitconfig
ln -sf $DOTFILES/hgrc           $HOME/.hgrc
ln -sf $DOTFILES/isort.cfg      $HOME/.isort.cfg
ln -sf $DOTFILES/npmrc          $HOME/.npmrc
ln -sf $DOTFILES/nvim           $HOME/.config/nvim
ln -sf $DOTFILES/profile        $HOME/.profile
ln -sf $DOTFILES/sway           $HOME/.config/sway
ln -sf $DOTFILES/tmux.conf      $HOME/.tmux.conf
ln -sf $DOTFILES/vscode         $HOME/.config/Code/User
ln -sf $DOTFILES/waybar         $HOME/.config/waybar
ln -sf $DOTFILES/zshrc          $HOME/.zshrc

if [[ `uname -s` == "Darwin" ]]; then
  ln -sf $DOTFILES/vscode $HOME/Library/Application\ Support/Code/User
fi

echo "syntax:glob" > $DOTFILES/hgignore
cat $DOTFILES/gitignore >> $DOTFILES/hgignore

if [[ ! -f $DOTFILES/nvim/autoload/plug.vim  ]]; then
  curl -fLo $DOTFILES/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


