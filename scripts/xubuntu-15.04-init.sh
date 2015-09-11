#!/bin/bash

# farsi_locale
cp /etc/default/locale /etc/default/locale.back
sed -i 's/en_US/fa_IR/g' /etc/default/locale

# use GUI for this section
# enable partners
#cp /etc/apt/sources.list /etc/apt/sources.list.back
#sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
# disable src repos
#sed -i '/^deb-src/s/^/#/' /etc/apt/sources.list

# apt-fast
#apt-add-repository -y ppa:saiarcot895/myppa
# laptop tweaks
if [ ! -f /etc/apt/sources.list.d/linrunner-ubuntu-tlp-vivid.list ]
then
    add-apt-repository -y ppa:linrunner/tlp
fi

apt-get update
#apt-get install -y apt-fast
apt-get -y purge gimp gmusicbrowser parole apport*
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y install clementine git mercurial gitg python-pip python3-pip python-gpgme guake bumblebee tlp tlp-rdw ubuntu-restricted-extras libavcodec-extra vlc vim-gnome tmux axel curl synaptic shadowsocks quodlibet
apt-get -y autoremove
