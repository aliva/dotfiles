#!/bin/bash

set -e

export DOTFILES=$HOME/Workspace/dotfiles

rm -rf $HOME/.config/Code/User
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/rofi
rm -rf $HOME/.config/sway
rm -rf $HOME/.config/swaylock
rm -rf $HOME/.config/waybar

mkdir -p $HOME/.aria2/
mkdir -p $HOME/.config/
mkdir -p $HOME/.config/Code/
mkdir -p $HOME/.config/Code\ -\ OSS/
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.config/swaylock

# MacOS
if [[ `uname -s` == "Darwin" ]]; then
  ln -sf $DOTFILES/vscode $HOME/Library/Application\ Support/Code/User
fi

# asdf
if [[ ! -d $HOME/.asdf ]]; then
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
fi

# oh-my-zsh
if [[ ! -d $HOME/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# vim.plug
if [[ ! -f $DOTFILES/nvim/autoload/plug.vim  ]]; then
  curl -fLo $DOTFILES/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# starship
if ! type starship > /dev/null && [[ ! -f $HOME/.local/bin/starship  ]]; then
  curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir $HOME/.local/bin --yes
fi

# dracula
if [[ ! -d $DOTFILES/external/dracula-rofi ]]; then
  git clone https://github.com/dracula/rofi $DOTFILES/external/dracula-rofi
fi
if [[ ! -d $DOTFILES/external/dracula-swaylock ]]; then
  git clone https://github.com/dracula/swaylock $DOTFILES/external/dracula-swaylock
fi

ln -sf $DOTFILES/ackrc          $HOME/.ackrc
ln -sf $DOTFILES/aria2.conf     $HOME/.aria2/aria2.conf
ln -sf $DOTFILES/bashrc         $HOME/.bashrc
ln -sf $DOTFILES/editorconfig   $HOME/.editorconfig
ln -sf $DOTFILES/flake8         $HOME/.config/flake8
ln -sf $DOTFILES/gitconfig      $HOME/.gitconfig
ln -sf $DOTFILES/isort.cfg      $HOME/.isort.cfg
ln -sf $DOTFILES/npmrc          $HOME/.npmrc
ln -sf $DOTFILES/nvim           $HOME/.config/nvim
ln -sf $DOTFILES/profile        $HOME/.profile
ln -sf $DOTFILES/starship.toml  $HOME/.config/starship.toml
ln -sf $DOTFILES/sway           $HOME/.config/sway
ln -sf $DOTFILES/tmux.conf      $HOME/.tmux.conf
ln -sf $DOTFILES/tool-versions  $HOME/.tool-versions
ln -sf $DOTFILES/vscode         $HOME/.config/Code/User
ln -sf $DOTFILES/vscode         $HOME/.config/Code\ -\ OSS/User
ln -sf $DOTFILES/waybar         $HOME/.config/waybar
ln -sf $DOTFILES/zshrc          $HOME/.zshrc

# External
ln -sf $DOTFILES/external/dracula-rofi/theme/config1.rasi $HOME/.config/rofi/config.rasi
ln -sf $DOTFILES/external/dracula-swaylock/swaylock/config $HOME/.config/swaylock/config


echo "Done."
