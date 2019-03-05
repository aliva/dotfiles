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
alias cdn="cd ~/Documents/notes"
# python
alias lsvirtualenv="lsvirtualenv -b"
# clipboard
alias clip='xclip -selection clipboard -i'
# vim
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
fi
