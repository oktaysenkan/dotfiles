#!/usr/bin/env zsh

# Starship

exists() { declare -F "$1" > /dev/null; }

if ! exists sharship; then
    curl -sS https://starship.rs/install.sh | sh
else
    echo "Starship already installed!"
fi