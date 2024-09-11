# Clear greeting
set -g fish_greeting ""

# Set environment variables
set -x VISUAL vim
set -x EDITOR $VISUAL
set -x JAVA_HOME $JAVA21_HOME

fish_add_path "$HOME/bin"
fish_add_path "$HOME/.rd/bin"
fish_add_path "/opt/homebrew/opt/curl/bin"

# Use Vim keybindings
fish_vi_key_bindings

set -x GPG_TTY (tty)

source ~/.config/fish/abbrs.fish
starship init fish | source
