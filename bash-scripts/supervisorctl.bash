# pfreixes, 2012-07-27
# from: https://gist.github.com/pfreixes/3187511
# Add to /etc/bash_completion.d/supervisorctl

_supervisor()
{
    local cur prev opts base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    #
    #  The basic options we'll complete.
    #
    opts="add clear fg open quit remove restart start stop update avail exit maintail pid reload reread shutdown status tail version"


    #
    #  Complete the arguments to some of the basic commands.
    #
    case "${prev}" in
        start|stop|restart|status)
            local process=$(for x in `supervisorctl avail | awk '{print $1}'`; do echo ${x} ; done )
            COMPREPLY=( $(compgen -W "${process}" -- ${cur}) )
            return 0
            ;;
        *)
        ;;
    esac

   COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
   return 0
}
complete -F _supervisor supervisorctl
