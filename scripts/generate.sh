#!/bin/bash

ROOT=`git rev-parse --show-toplevel`

function die {
    echo "* ERROR *"
    echo "* $@"
    exit 1
}

# regenerate gitignore file
echo hgignore
echo syntax:glob > $ROOT/hgignore
cat $ROOT/gitignore >> $ROOT/hgignore

# crontab
echo crontab/root
sudo crontab -l > $ROOT/crontab/root.$HOSTNAME.crontab
echo crontab/`whoami`
crontab -l > $ROOT/crontab/`whoami`.$HOSTNAME.crontab

