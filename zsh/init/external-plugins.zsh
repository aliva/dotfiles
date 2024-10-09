# Function to source a file if it exists
source_if_exists() {
  if [ -f "$1" ]; then
    source "$1"
  fi
}

# Autosuggestions
source_if_exists "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source_if_exists "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source_if_exists "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Syntax Highlighting
source_if_exists "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source_if_exists "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
