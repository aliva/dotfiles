set -g fish_prompt_pwd_dir_length 20

function fish_right_prompt
    echo (prompt_pwd)
end
