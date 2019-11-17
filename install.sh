#!/bin/bash

set -e

export DOTFILES=$HOME/Workspace/dotfiles

if [[ ! -f $DOTFILES/nvim/autoload/plug.vim  ]]; then
    curl -fLo $DOTFILES/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


ln -sf $DOTFILES/ackrc          $HOME/.ackrc
ln -sf $DOTFILES/bashrc         $HOME/.bashrc
ln -sf $DOTFILES/editorconfig   $HOME/.editorconfig
ln -sf $DOTFILES/gitconfig      $HOME/.gitconfig
ln -sf $DOTFILES/hgrc           $HOME/.hgrc
ln -sf $DOTFILES/isort.cfg      $HOME/.isort.cfg
ln -sf $DOTFILES/npmrc          $HOME/.npmrc
ln -sf $DOTFILES/profile        $HOME/.profile
ln -sf $DOTFILES/pythonrc       $HOME/.pythonrc
ln -sf $DOTFILES/tmux.conf      $HOME/.tmux.conf
ln -sf $DOTFILES/zshrc          $HOME/.zshrc

rm -rf $HOME/.emacs.d
ln -sf $DOTFILES/emacs.d        $HOME/.emacs.d

mkdir -p $HOME/.aria2/
ln -sf $DOTFILES/aria2.conf     $HOME/.aria2/aria2.conf

mkdir -p $HOME/.config/

rm -rf $HOME/.config/fish
rm -rf $HOME/.config/nvim
ln -sf $DOTFILES/fish           $HOME/.config/fish
ln -sf $DOTFILES/nvim           $HOME/.config/nvim

mkdir -p $HOME/.config/Code/
mkdir -p "$HOME/.config/Code - OSS/"
rm -rf $HOME/.config/Code/User
rm -rf "$HOME/.config/Code - OSS/User"
ln -sf $DOTFILES/vscode         $HOME/.config/Code/User
ln -sf $DOTFILES/vscode         "$HOME/.config/Code - OSS/User"

echo "syntax:glob" > $DOTFILES/hgignore
cat $DOTFILES/gitignore >> $DOTFILES/hgignore
