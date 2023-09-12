#!/usr/bin/env zsh

exists() { declare -F "$1" > /dev/null; }

if ! exists volta; then
    echo "Volta is not installed!"
else
    echo "Node installing"
    volta install node@latest
    echo "Node installed!"
fi


