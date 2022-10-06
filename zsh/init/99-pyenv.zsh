export PYENV_ROOT="$HOME/.pyenv"

if [ -x "$(command -v pyenv)" ] || [ -d $PYENV_ROOT ]
then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi
