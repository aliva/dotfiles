#!/bin/sh

pimp(){
    pimp_guess_project_root

    if [[ $1 = "init" ]]
    then
        if command -v pyvenv >/dev/null ;then
            PIMP_VENV_COMMAND="pyvenv"
        elif command -v pyvenv-3.4 >/dev/null ;then
            PIMP_VENV_COMMAND="pyvenv-3.4"
        else
            echo "could not run pyvenv (did you install it globally?)"
            die
            return 1
        fi
        $PIMP_VENV_COMMAND --without-pip $PIMP_PROJECT_ROOT/venv || return 1
        cd $PIMP_PROJECT_ROOT/venv
        source bin/activate
        if ! ls bin/pip &>/dev/null
        then
            wget https://bootstrap.pypa.io/get-pip.py || return 1
            python get-pip.py || return 1
        fi
        cd $PIMP_PROJECT_ROOT
        touch requirements.txt
        if git rev-parse --show-toplevel &>/dev/null || ! hg root &>/dev/null
        then
            git init
            echo "/venv/" >> .gitignore
        fi
        deactivate
        echo "DONE!"
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

pimp_guess_project_root(){
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
    echo $PIMP_PROJECT_ROOT
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

