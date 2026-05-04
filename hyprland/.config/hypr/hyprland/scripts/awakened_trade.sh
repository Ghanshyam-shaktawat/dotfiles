#!/bin/bash

APP_PATH="$HOME/awakened-poe/Awakened-PoE-Trade-3.28.103.AppImage"
APP_NAME="$(basename "$APP_PATH")"
ARGS="--ozone-platform=x11"

# Check if running
if pgrep -f "$APP_NAME" >/dev/null; then
  echo "$APP_NAME is running. Closing it..."
  pkill chmod +x "$HOME/Applications/YourApp.AppImage"-f "$APP_NAME"
else
  echo "$APP_NAME is not running. Launching it..."
  "$APP_PATH" ARGS &
fi
