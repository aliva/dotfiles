
function __complete_mc
    set -lx COMP_LINE (string join ' ' (commandline -o))
    test (commandline -ct) = ""
    and set COMP_LINE "$COMP_LINE "
    /home/ali/.local/bin/mc
end
complete -c mc -a "(__complete_mc)"

