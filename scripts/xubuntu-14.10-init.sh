#!/bin/bash

# farsi_locale
cp /etc/default/locale /etc/default/locale.back
sed -i 's/en_US/fa_IR/g' /etc/default/locale

# enable partners
cp /etc/apt/sources.list /etc/apt/sources.list.back
sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
# disable src repos
sed -i '/^deb-src/s/^/#/' /etc/apt/sources.list

# apt-fast
apt-add-repository -y ppa:saiarcot895/myppa
# laptop tweaks
add-apt-repository -y ppa:linrunner/tlp

apt-get update
apt-get install -y apt-fast
apt-get -y purge gimp gmusicbrowser parole gnumeric
apt-fast -y upgrade
apt-fast -y dist-upgrade
apt-fast -y install clementine tor git mercurial gitg python-pip python-gpgme guake nautilus nautilus-open-terminal gedit gnome-terminal bumblebee tlp tlp-rdw ubuntu-restricted-extras libavcodec-extra vlc openjdk-8-jdk vim-gnome wine mongodb tmux axel curl synaptic
apt-get -y autoremove

pip install shadowsocks

# mongo
service mongodb stop
update-rc.d -f mongodb remove

# tor
cp ../torrc /etc/tor/torrc
service tor restart

# bug report
service apport stop
update-rc.d -f apport remove
