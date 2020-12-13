# date
alias ymd="date +%Y-%m-%d"
alias jymd="jdate +%Y-%m-%d"
# internet
alias myip="curl -s icanhazip.com"
alias p8="ping 8.8.8.8"
alias wget="wget -c"
alias aria2c="aria2c --dir=$HOME/Downloads/aria2c"
# path
alias cdd="cd $DOTFILES"
alias cdw="cd $HOME/Workspace"
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

