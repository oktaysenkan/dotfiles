#!/usr/bin/env zsh
if [[ $(uname -m) == 'arm64' ]]; then
    BREW_PATH="/opt/homebrew/bin/brew"
else
    BREW_PATH="/usr/local/bin/brew"
fi

if ! command -v $BREW_PATH &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Brew already installed!"
fi

echo "Brewfile installing"

$BREW_PATH bundle