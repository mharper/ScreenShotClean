#!/bin/sh

USER_LAUNCH_AGENTS_DIR="$HOME/Library/LaunchDaemons"
USER_APP_SUPPORT_DIR="$HOME/Library/Application Support/ScreenShotClean"
PLIST_FILE='com.standalonecode.screenshotclean.plist'

launchctl unload "$USER_LAUNCH_AGENTS_DIR/$PLIST_FILE"
rm -f "$USER_LAUNCH_AGENTS_DIR/$PLIST_FILE"
rm -rf "$USER_APP_SUPPORT_DIR"
