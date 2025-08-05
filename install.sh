#!/bin/bash

# Exit on error
set -e

# Configuration
DOTFILES="$HOME/Workspace/dotfiles"
CONFIG_DIR="$HOME/.config"

echo "Starting dotfiles installation..."

# Remove existing configs that will be replaced
rm -rf "$CONFIG_DIR/Code/User"
rm -rf "$CONFIG_DIR/nvim"

# Create required directories
echo "Creating config directories..."
mkdir -p "$CONFIG_DIR"
mkdir -p "$CONFIG_DIR/Code"

# MacOS specific setup
if [[ $(uname -s) == "Darwin" ]]; then
    ln -sf "$DOTFILES/vscode" "$HOME/Library/Application Support/Code/User"
fi

# Install dependencies if not present
echo "Checking dependencies..."

if [[ ! -d "$HOME/.oh-my-zsh" ]]; en
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ]]; then
    echo "Installing vim-plug..."
    curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Link all config files
echo "Linking dotfiles..."
ln -sf "$DOTFILES/bashrc"         "$HOME/.bashrc"
ln -sf "$DOTFILES/editorconfig"   "$HOME/.editorconfig"
ln -sf "$DOTFILES/flake8"         "$CONFIG_DIR/flake8"
ln -sf "$DOTFILES/gitconfig"      "$HOME/.gitconfig"
ln -sf "$DOTFILES/isort.cfg"      "$HOME/.isort.cfg"
ln -sf "$DOTFILES/npmrc"          "$HOME/.npmrc"
ln -sf "$DOTFILES/nvim"           "$CONFIG_DIR/nvim"
ln -sf "$DOTFILES/profile"        "$HOME/.profile"
ln -sf "$DOTFILES/starship.toml"  "$CONFIG_DIR/starship.toml"
ln -sf "$DOTFILES/tmux.conf"      "$HOME/.tmux.conf"
ln -sf "$DOTFILES/vscode"         "$CONFIG_DIR/Code/User"
ln -sf "$DOTFILES/zshrc"          "$HOME/.zshrc"

echo "Installation complete!"
