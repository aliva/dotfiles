# vim: set ft=zsh:

# see all colors
# spectrum_ls

export VIRTUAL_ENV_DISABLE_PROMPT=1
# Git
export ZSH_THEME_GIT_PROMPT_PREFIX=" "
export ZSH_THEME_GIT_PROMPT_SUFFIX=""
export ZSH_THEME_GIT_PROMPT_SEPARATOR=""
# k8s
export KUBE_PS1_SYMBOL_DEFAULT="k8s"
export KUBE_PS1_PREFIX=""
export KUBE_PS1_SUFFIX=""
export KUBE_PS1_NS_ENABLE="false"
export KUBE_PS1_CLUSTER_FUNCTION=_k8s_cluster_short
# kubeoff to disable

function _k8s_cluster_short() {
  echo "$1" | cut -d . -f1
}

function _venv_info {
    [[ -n "$VIRTUAL_ENV" ]] && echo "%{$fg[yellow]%}py%{$reset_color%}|%{$fg[yellow]%}${VIRTUAL_ENV:t} "
}

function _git_info {
    echo "$(git_super_status) "
}

function _dir_info {
    echo "%{$fg[cyan]%}%~"
}

PROMPT='%{$FG[046]%}$%{$reset_color%} '

RPROMPT='$(_venv_info)$(kube_ps1)$(_git_info)$(_dir_info)%{$reset_color%}'

