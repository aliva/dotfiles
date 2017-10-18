export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info {
    [[ -n "$VIRTUAL_ENV" ]] && echo ' ('${VIRTUAL_ENV:t}')'
}

function git_branch {
    branch=`git symbolic-ref --short HEAD 2>/dev/null`
    if [[ $! -ne 0 ]]
    then
        echo " $branch"
    fi
}
PROMPT='%{$fg[green]%}$%{$reset_color%} '

RPROMPT='%{$fg[green]%}%~%{$fg[yellow]%}$(virtualenv_info)%{$fg[blue]%}$(git_branch)%{$reset_color%}'
