
function fish_right_prompt
    set -g fish_prompt_pwd_dir_length 20

    set_color 8be9fd
    echo (prompt_pwd)

    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showstashstate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showcolorhints 1
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_showupstream verbose git
    set -g __fish_git_prompt_char_stateseparator ""

    set_color normal
    echo (__fish_git_prompt ' %s')
end
