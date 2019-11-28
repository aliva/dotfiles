# date
alias ymd="date +%Y-%m-%d"
alias jymd="jdate +%Y-%m-%d"
# internet
alias myip="curl -s icanhazip.com"
alias p8="ping 8.8.8.8"
alias axel="axel -a -n 50"
alias wget="wget -c"
alias aria2c="aria2c --dir=$HOME/Downloads/aria2c"
alias pc="proxychains"
# path
alias cdd="cd ~/Workspace/dotfiles"
alias cdw="cd ~/Workspace"
alias cdt="cd /tmp"
alias cdir='basename "$PWD"'
# python
alias lsvirtualenv="lsvirtualenv -b"
# clipboard
if [[ `uname -s` == "Darwin" ]]; then
  alias clip='pbcopy'
else
  alias clip='xclip -selection clipboard -i'
fi
# vim
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
fi
