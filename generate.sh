#!/bin/bash

ROOT=`hg root`

function die {
    echo "* ERROR *"
    echo "* $@"
    exit 1
}

function get {
    echo $2
    wget -q $1 -O $ROOT/$2 || die $1 $2
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

# vudnle
if ! [ -d $ROOT/vim/bundle/vundle ]
then
    git clone https://github.com/gmarik/vundle.git $ROOT/vim/bundle/vundle
fi

# do not download these files every time, they don't change often
exit

# hg bash-autocompltion
get http://selenic.com/hg/raw-file/tip/contrib/bash_completion bash-completion/mercurial.bash

# hg vim plugin
get http://selenic.com/hg/raw-file/tip/contrib/vim tmp
sed -i '/^$/d' $ROOT/tmp
for f in `cat $ROOT/tmp | awk '{print $3}'`
do
    get http://selenic.com/hg/raw-file/tip/contrib/vim/$f vim/plugin/$f
done
rm $ROOT/tmp

echo "* DONE! *"
