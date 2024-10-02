set -e

sudo apt --yes update
sudo apt --yes upgrade
sudo apt --yes install \
    curl \
    fzf \
    git \
    neovim \
    ubuntu-gnome-desktop \
    virtualenvwrapper \
    zsh
