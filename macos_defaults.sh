#!/bin/bash
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true
# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


# Enabling the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# Show the status bar in the lower corner when hovering links
defaults write com.apple.Safari ShowOverlayStatusBar -bool true


# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true


# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true


killall Dock
echo "Done. Note that some of these changes require a logout/restart to take effect."
