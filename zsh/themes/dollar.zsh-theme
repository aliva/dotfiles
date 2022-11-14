# see all colors
# spectrum_ls

export VIRTUAL_ENV_DISABLE_PROMPT=1
# Git
export ZSH_THEME_GIT_PROMPT_PREFIX=""
export ZSH_THEME_GIT_PROMPT_SUFFIX=" "
export ZSH_THEME_GIT_PROMPT_SEPARATOR=""
# k8s
export KUBE_PS1_SYMBOL_DEFAULT="k8s"
export KUBE_PS1_PREFIX=""
export KUBE_PS1_SUFFIX=""
# export KUBE_PS1_NS_ENABLE="false"
export KUBE_PS1_CLUSTER_FUNCTION=_k8s_cluster_short
# kubeoff to disable

function _k8s_cluster_short() {
  echo "$1" | cut -d . -f1
}

function _info_prefix {
    echo "%{$fg[blue]%}$1%{$reset_color%}|"
}

function _venv_info {
    [[ -n "$VIRTUAL_ENV" ]] && echo "$(_info_prefix py)%{$fg[yellow]%}${VIRTUAL_ENV:t} "
}

function _dir_info {
    echo "%{$FG[153]%}%30<…<%~"
}

PROMPT='%{$FG[046]%}$%{$reset_color%} '

RPROMPT='$(_venv_info)$(kube_ps1)$(git_super_status)$(_dir_info)%{$reset_color%}'

