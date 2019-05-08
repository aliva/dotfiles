# proxychains
compdef _precommand proxychains
compdef _precommand pc
# minio client
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/.local/bin/mc mc
