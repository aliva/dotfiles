set -g fish_prompt_pwd_dir_length 20

function fish_right_prompt
    set_color 8be9fd
    echo (prompt_pwd)

    set_color normal
end
