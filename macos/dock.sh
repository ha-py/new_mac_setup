#!/bin/sh

dockutil --no-restart --remove all

dockutil --no-restart --add "/System/Applications/Launchpad.app"
dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Emacs.app"
dockutil --no-restart --add "/Applications/Microsoft Excel.app"
dockutil --no-restart --add "/Applications/Microsoft Teams.app"
dockutil --no-restart --add "/Applications/Microsoft Word.app"
dockutil --no-restart --add "/Applications/iterm.app"
dockutil --add https://app.my.workflowmax.com/my/overview.aspx --label 'WorkFlowMax' --display folder

#The following adds a spacer tile in the apps section after System Preferences
dockutil --add '' --type spacer --section apps --after "System Preferences"




killall Dock
