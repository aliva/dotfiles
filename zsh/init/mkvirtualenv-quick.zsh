function mkvirtualenv-quick() {
    local ENV_NAME
    ENV_NAME="$(basename "$PWD")"

    local PYTHON_BIN=""
    if command -v mise >/dev/null 2>&1; then
        PYTHON_BIN="$(mise which python 2>/dev/null || true)"
    fi

    # Fallback if mise didn't return anything
    if [[ -z "$PYTHON_BIN" ]]; then
        PYTHON_BIN="$(command -v python3 2>/dev/null || command -v python)"
    fi

    if [[ -z "$PYTHON_BIN" ]]; then
        echo "No python interpreter found (mise or system)." >&2
        return 1
    fi

    mkvirtualenv "$ENV_NAME" -p "$PYTHON_BIN"
}
