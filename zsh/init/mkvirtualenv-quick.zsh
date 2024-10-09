function mkvirtualenv-quick {
    local ENV_NAME=$(basename "$PWD")
    local PYTHON_BIN=$(asdf which python)

    # Create the virtual environment
    mkvirtualenv "$ENV_NAME" -p "$PYTHON_BIN"
}
