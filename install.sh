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

# vim-plug
mkdir -p vim/autoload
get https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim vim/autoload/plug.vim

# hg bash-autocompltion
get http://selenic.com/hg/raw-file/tip/contrib/bash_completion bash-scripts/mercurial.bash

# pip bash-autocompltion
get https://raw.githubusercontent.com/ekalinin/pip-bash-completion/master/pip bash-scripts/pip.bash

# django-autocompltion
get https://github.com/django/django/raw/master/extras/django_bash_completion bash-scripts/django.bash

# pimp
get https://github.com/aliva/pimp/raw/master/pimp.sh bash-scripts/pimp.bash

# invoke
get https://raw.githubusercontent.com/pyinvoke/invoke/master/completion/bash bash-scripts/invoke.bash

echo "* DONE! *"
