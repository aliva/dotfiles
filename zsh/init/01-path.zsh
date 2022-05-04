# Path
PATHES=(
  # Custom
  $DOTFILES/bin/
  $HOME/Workspace/tools/flutter/bin/
  $HOME/.pub-cache/bin/
  $HOME/Workspace/tools/npm-packages/bin/
  # Global
  /usr/local/sbin
  /usr/local/bin
  /usr/sbin
  /usr/bin
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
