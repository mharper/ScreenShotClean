#!/bin/sh

USER_LAUNCH_AGENTS_DIR="$HOME/Library/LaunchDaemons"
USER_APP_SUPPORT_DIR="$HOME/Library/Application Support/ScreenShotClean"
PLIST_FILE='com.standalonecode.screenshotclean.plist'
CLEAN_FILE='screenshotclean.sh'
UNINSTALL_FILE='uninstall.sh'

mkdir -p "$USER_LAUNCH_AGENTS_DIR"
sed s:USER_HOME:"$HOME": <"./resources/$PLIST_FILE" >"$USER_LAUNCH_AGENTS_DIR/$PLIST_FILE"

mkdir -p "$USER_APP_SUPPORT_DIR"
cp "./bin/$CLEAN_FILE" "$USER_APP_SUPPORT_DIR"
cp "$UNINSTALL_FILE" "$USER_APP_SUPPORT_DIR"

launchctl load "$USER_LAUNCH_AGENTS_DIR/$PLIST_FILE"