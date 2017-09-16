export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info {
    [[ -n "$VIRTUAL_ENV" ]] && echo ' ('${VIRTUAL_ENV:t}')'
}

PROMPT='%{$fg[green]%}$%{$reset_color%} '

RPROMPT='%{$fg[cyan]%}%~%{$reset_color%}%{$fg[yellow]%}$(virtualenv_info)%{$reset_color%}'
