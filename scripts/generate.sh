#!/bin/bash

ROOT=`hg root`

function die {
    echo "* ERROR *"
    echo "* $@"
    exit 1
}

# regenerate gitignore file
echo gitignore
tail -n +3 $ROOT/hgignore > $ROOT/gitignore

# regenerate bzri ignore file
echo bazaar/ignore
tail -n +3 $ROOT/hgignore > $ROOT/bazaar/ignore

# crontab
echo crontab/root
sudo crontab -l > $ROOT/crontab/root
echo crontab/`whoami`
crontab -l > $ROOT/crontab/`whoami`

