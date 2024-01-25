function mkvirtualenv-quick {
    ENV_NAME=`basename "$PWD"`
    PYTHON_BIN=`asdf which python`
    mkvirtualenv $ENV_NAME -p $PYTHON_BIN
}
