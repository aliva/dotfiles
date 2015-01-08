#!/bin/bash

ROOT=`git rev-parse --show-toplevel`

function die {
    echo "* ERROR *"
    echo "* $@"
    exit 1
}

function get {
    echo $2
    wget -q $1 -O $ROOT/$2 || die $1 $2
}

# hg bash-autocompltion
get http://selenic.com/hg/raw-file/tip/contrib/bash_completion bash-completion/mercurial.bash

# pip bash-autocompltion
get https://raw.githubusercontent.com/ekalinin/pip-bash-completion/master/pip bash-completion/pip.bash

echo "* DONE! *"
