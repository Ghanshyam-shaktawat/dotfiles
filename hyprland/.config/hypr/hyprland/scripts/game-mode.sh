#!/bin/bash

# Get the line with resolution and position for DP-3
line=$(hyprctl monitors all | awk '/Monitor DP-3/{flag=1;next}/Monitor/{flag=0}flag && /@/{print; exit}')

# Extract the position part after "at"
pos=$(echo "$line" | awk -F'at ' '{print $2}')

# Decide which command to run
if [[ "$pos" != "1920x0" ]]; then
  echo "Position is $pos (not 1920x0), running command with 1920x0..."
  hyprctl keyword monitor DP-3,1920x1080@75,1920x0,1
  notify-send "Game Mode OFF"
else
  echo "Position is $pos (1920x0), running command with 3840x0..."
  hyprctl keyword monitor DP-3,1920x1080@75,3840x0,1
  notify-send "Game Mode ON"
fi
