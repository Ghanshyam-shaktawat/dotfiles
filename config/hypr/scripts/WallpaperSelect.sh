#!/usr/bin/env sh

# set variables
ScrDir=$(dirname "$(realpath "$0")")
source $ScrDir/GlobalControl.sh
RofiConf="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/selector.rasi"

ctlLine=$(grep '^1|' "$ThemeCtl")
if [ $(echo $ctlLine | wc -l) -ne "1" ]; then
	echo "ERROR : $ThemeCtl Unable to fetch theme..."
	exit 1
fi

fullPath=$(echo "$ctlLine" | awk -F '|' '{print $NF}' | sed "s+~+$HOME+")
wallPath="/home/ghanshyam/Pictures/wallpapers"

# scale for monitor x res
x_monres=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
monitor_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')
x_monres=$((x_monres * 17 / monitor_scale))

# set rofi override
elem_border=$((hypr_border * 3))
r_override="element{border-radius:${elem_border}px;} listview{columns:6;spacing:100px;} element{padding:0px;orientation:vertical;} element-icon{size:${x_monres}px;border-radius:0px;} element-text{padding:20px;}"

# launch rofi menu
currentWall=$(basename $fullPath)
RofiSel=$(find "${wallPath}" -type f \( -iname "*.gif" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort | while read rfile; do
	echo -en "$rfile\x00icon\x1f${cacheDir}/${rfile}\n"
done | rofi -dmenu -theme-str "${r_override}" -config "${RofiConf}" -select "${currentWall}")

# apply wallpaper
if [ ! -z "${RofiSel}" ]; then
	"${ScrDir}/Wallpaper.sh" -s "${wallPath}/${RofiSel}"
	notify-send "Wallpaper Changed" " ${RofiSel}" -i "${cacheDir}/${RofiSel}" -r 91190 -t 2200
	# notify-send -a Rofi -r 2 -t 2200 "${RofiSel}" -i "Wallpaper Changed" "${RofiSel}"

fi
