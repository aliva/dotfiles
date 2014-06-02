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

# vudnle
if ! [ -d $ROOT/vim/bundle/vundle ]
then
    git clone https://github.com/gmarik/vundle.git $ROOT/vim/bundle/vundle
fi

# hg bash-autocompltion
get http://selenic.com/hg/raw-file/tip/contrib/bash_completion bash-completion/mercurial.bash

# pip bash-autocompltion
get https://raw.githubusercontent.com/ekalinin/pip-bash-completion/master/pip bash-completion/pip.bash

# hg vim plugin
get http://selenic.com/hg/raw-file/tip/contrib/vim tmp
sed -i '/^$/d' $ROOT/tmp
for f in `cat $ROOT/tmp | awk '{print $3}'`
do
    get http://selenic.com/hg/raw-file/tip/contrib/vim/$f vim/plugin/$f
done
rm $ROOT/tmp

echo "* DONE! *"