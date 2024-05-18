#!/usr/bin/env sh

# Path to the JSON file
json_file="${HOME}/.config/hypr/Hyprland/trackpad.json"

# Read the JSON value
disable_value=$(jq -r '.disable' "$json_file")

# Check the value and perform actions accordingly
if [[ "$disable_value" == "0" ]]; then
	hyprctl -r keyword '$TOUCH_STATE' 1
	notify-send -u normal -i Rofi "Touchpad Enabled!" -t 2000
	jq '.disable = 1' "$json_file" >"$json_file.tmp" && mv "$json_file.tmp" "$json_file"
else
	hyprctl -r keyword '$TOUCH_STATE' 0
	notify-send -u normal -i Rofi "Touchpad disabled!" -t 2000
	jq '.disable = 0' "$json_file" >"$json_file.tmp" && mv "$json_file.tmp" "$json_file"
fi
