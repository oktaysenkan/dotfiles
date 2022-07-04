#!/usr/bin/env zsh

exists() { declare -F "$1" > /dev/null; }

if ! exists brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Brew already installed!"
fi


echo "Brewfile installing"

brew bundle