#!/bin/bash

# farsi_locale
cp /etc/default/locale /etc/default/locale.back
sed -i 's/en_US/fa_IR/g' /etc/default/locale

# enable partners
cp /etc/apt/sources.list /etc/apt/sources.list.back1
sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
# disable src repos
cp /etc/apt/sources.list /etc/apt/sources.list.back2
sed -i '/^deb-src/s/^/#/' /etc/apt/sources.list

# apt-fast
apt-add-repository -y ppa:saiarcot895/myppa
# laptop tweaks
add-apt-repository -y ppa:linrunner/tlp

apt-get update
apt-get install -y apt-fast
apt-get -y purge gimp gmusicbrowser parole abiword gnumeric
apt-fast -y upgrade
apt-fast -y dist-upgrade
apt-fast -y install clementine tor git mercurial gitg python-pip python-gpgme guake nautilus nautilus-open-terminal gedit gnome-terminal bumblebee tlp tlp-rdw ubuntu-restricted-extras libavcodec-extra vlc openjdk-8-jdk vim-gnome wine mongodb
apt-get -y autoremove
pip install shadowsocks

service mongodb stop
update-rc.d -f mongodb remove

cp ../torrc /etc/tor/torrc
service tor restart
