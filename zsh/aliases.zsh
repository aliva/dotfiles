# apt
# alias apti="sudo apt install"
# alias apty="sudo apt update"
# alias aptu="sudo apt upgrade"
# alias apts="apt search"
# date
alias ymd="date +%Y-%m-%d"
alias jymd="jdate +%Y-%m-%d"
# internet
alias myip="curl -s icanhazip.com"
alias p8="ping 8.8.8.8 -i 3"
alias axel="axel -a -n 50"
alias wget="wget -c"
alias aria2c="aria2c --dir=$HOME/Downloads/aria2c"
alias pc="proxychains"
# path
alias cdd="cd ~/Workspace/dotfiles"
alias cdw="cd ~/Workspace"
alias cdt="cd /tmp"
alias cdp="cd ~/Workspace/pushe"
# python
alias lsvirtualenv="lsvirtualenv -b"
# youtube-dl
if [ -f ~/.bin/youtube-dl/bin/youtube-dl ]
then
    alias youtube-dl="~/.bin/youtube-dl/bin/youtube-dl"
fi
# tldr
if [ -f ~/.bin/tldr/node_modules/.bin/tldr ]
then
    alias tldr="~/.bin/tldr/node_modules/.bin/tldr"
fi
