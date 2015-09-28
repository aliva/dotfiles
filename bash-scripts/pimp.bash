#!/bin/sh

pimp(){
    _pimp_guess_project_root

    if [[ $1 = "init" ]]
    then
        _pimp_init
        return
    fi

    if [ ! -d $PIMP_PROJECT_ROOT/venv ]
    then
        echo "could not find venv dir"
        echo "there should be a venv directory in current path or project root"
        return 1
    fi
    PIMP_PROJECT_NAME="${PIMP_PROJECT_ROOT##*/}"

    case $1 in
    "activate")
        source $PIMP_PROJECT_ROOT/venv/bin/activate
        ;;
    "deactivate")
        PIMP_PROJECT_NAME=
        deactivate
        ;;
    "shell")
        source $PIMP_PROJECT_ROOT/venv/bin/activate
        python
        deactivate
        ;;
    "run")
        if [ -z $2 ]
        then
            echo "pimp run <script.py>"
        else
            source $PIMP_PROJECT_ROOT/venv/bin/activate
            python $2
            deactivate
        fi
        ;;
    "install")
        shift
        source $PIMP_PROJECT_ROOT/venv/bin/activate
        pip install $@
        deactivate
        ;;
    *)
        ;;
    esac
}

# this function tries to find the venv directory for current project
# it should be in current path
# or project root (based on git or hg)
_pimp_guess_project_root(){
    PIMP_PROJECT_ROOT=`pwd`
    if [ ! -d `pwd`/venv ]
    then
        if git rev-parse --show-toplevel &>/dev/null
        then
            PIMP_PROJECT_ROOT=`git rev-parse --show-toplevel`
        elif hg root &>/dev/null
        then
            PIMP_PROJECT_ROOT=`hg root`
        fi
    fi
}

# init virtualenv
_pimp_init(){
    # find pyvenv command
    if command -v pyvenv >/dev/null
    then
        PIMP_VENV_COMMAND="pyvenv"
    elif command -v pyvenv-3.4 >/dev/null
    then
        PIMP_VENV_COMMAND="pyvenv-3.4"
    else
        echo "ERR: could not run pyvenv (did you install it globally?)"
    fi
    
    # run pyvenv
    $PIMP_VENV_COMMAND $PIMP_PROJECT_ROOT/venv || return 1
    
    # create requirements.txt
    touch requirements.txt
    
    # create git repo if doesn't exists
    # add /venv/ to gitignore
    if ! git rev-parse --show-toplevel &>/dev/null && ! hg root &>/dev/null
    then
        git init
        
        if ! `grep ^\/venv\/$ .gitignore &>/dev/null`
        then
            echo "/venv/" >> .gitignore
        fi
    fi
    
    echo "DONE!"
}

# bash autocompletion
_pimp(){
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="init activate run deactivate shell install"

    if [ $COMP_CWORD == 1 ]
    then
        COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
        return 0
    fi
}
complete -o default -F _pimp pimp

