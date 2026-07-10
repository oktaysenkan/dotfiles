#!/usr/bin/env zsh

echo "Applying macOS settings..."

# Quit System Preferences so it doesn't override settings we're about to change
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# Dock                                                                        #
###############################################################################

# Dock icon size (pixels)
defaults write com.apple.dock tilesize -int 32

# Enable magnification and set the magnified icon size
defaults write com.apple.dock magnification -bool false

# Dock position: left | bottom | right
defaults write com.apple.dock orientation -string "bottom"

# Window minimize effect: genie | scale
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application's icon
defaults write com.apple.dock minimize-to-application -bool true

# Automatically hide the Dock
defaults write com.apple.dock autohide -bool true

# Dock hide/show delay and animation duration
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.15

# Don't show recent applications in the Dock
defaults write com.apple.dock show-recents -bool false

# Show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show the path bar and status bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Don't create .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Enable snap-to-grid for icons on the desktop and by name on standard view
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist

# Unhide the ~/Developer folder
chflags nohidden ~/Developer

###############################################################################
# Screenshots                                                                 #
###############################################################################

# Save screenshots to the ~/Desktop/Screenshots folder
mkdir -p "${HOME}/Desktop/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Desktop/Screenshots"

# Screenshot format: png | jpg | pdf
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# General UI                                                                  #
###############################################################################

# Expand the save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand the print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

###############################################################################
# Trackpad                                                                    #
###############################################################################

# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

###############################################################################
# Menu bar                                                                    #
###############################################################################

# Show battery percentage
defaults write com.apple.controlcenter BatteryShowPercentage -bool true

###############################################################################
# Security                                                                    #
###############################################################################

# Disable the "Are you sure you want to open this application?" quarantine dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

###############################################################################
# Apply changes                                                               #
###############################################################################

for app in "Dock" "Finder" "SystemUIServer" "ControlCenter"; do
    killall "${app}" &> /dev/null
done

echo "macOS settings applied! Some changes may require logging out and back in to take effect."
