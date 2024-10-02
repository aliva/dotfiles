set -e

sudo apt --yes update
sudo apt --yes upgrade
sudo apt --yes install \
    curl \
    fzf \
    git \
    gpaste-2 \
    neovim \
    pipx \
    ubuntu-gnome-desktop \
    virtualenvwrapper \
    zsh \
    zsh-autosuggestions
