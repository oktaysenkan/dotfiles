#!/usr/bin/env zsh

# Ensure system and Homebrew binaries are on PATH even in a minimal environment
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${PATH}"

echo "Pointing iTerm2 to dotfiles settings folder..."

# Load preferences from the dotfiles iterm2 folder
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${HOME}/dotfiles/iterm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

echo "iTerm2 configured!"
