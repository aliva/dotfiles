# vim: set ft=zsh:

export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info {
    [[ -n "$VIRTUAL_ENV" ]] && echo ' ('${VIRTUAL_ENV:t}')'
}

# function git_branch {
#     branch=`branch_prompt_info`
#     if [[ $! -ne 0 ]]
#     then
#         echo " $branch"
#     fi
# }

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=""

PROMPT='%{$fg[green]%}$%{$reset_color%} '

RPROMPT='%{$fg[green]%}%~%{$fg[yellow]%}$(virtualenv_info)%{$fg[blue]%}$(git_super_status)%{$reset_color%}'

