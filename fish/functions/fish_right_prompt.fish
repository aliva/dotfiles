
function fish_right_prompt
    set -g fish_prompt_pwd_dir_length 20
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showstashstate 1
    set -g __fish_git_prompt_showuntrackedfiles 1

    set_color 8be9fd
    echo (prompt_pwd)

    set_color 6272a4
    echo (__fish_git_prompt)

    set_color normal
end
