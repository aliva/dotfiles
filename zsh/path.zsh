# Path
PATHES=(
  $HOME/.local/bin
  $DOTFILES/bin
  $HOME/.cargo/bin
  $GOPATH/bin
  $NPM_PACKAGES/bin
  /usr/local/sbin
  /usr/local/bin
  /usr/sbin
  /usr/bin
  /usr/bin/vendor_perl
  /sbin
  /bin
  /usr/games
  /usr/local/games
)

unset PATH
for p in $PATHES
do
  if [ -d $p ]
  then
    if [ -z $PATH ]
    then
      PATH=$p
    else
      PATH="$PATH:$p"
    fi
  fi
done

unset PATHES p
export PATH
