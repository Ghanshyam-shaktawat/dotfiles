#!/usr/bin/env sh

# set variables
ScrDir=$(dirname "$(realpath "$0")")
DcoDir="${XDG_CONFIG_HOME:-$HOME/.config}/hypr/wallbash"
TgtScr=$ScrDir/GlobalControl.sh
source $ScrDir/GlobalControl.sh

# switch WallDcol variable
if [ $EnableWallDcol -eq 1 ]; then
	sed -i "/^EnableWallDcol/c\EnableWallDcol=0" $TgtScr
	notif=" Wallbash disabled..."
else
	sed -i "/^EnableWallDcol/c\EnableWallDcol=1" $TgtScr
	notif=" Wallbash enabled..."
fi

# reset the colors
grep -m 1 '.' $DcoDir/*.dcol | awk -F '|' '{print $2}' | while read wallbash; do
	if [ ! -z "$wallbash" ]; then
		eval "${wallbash}"
	fi
done

notify-send -a "$notif" -i "~/.config/dunst/icons/hyprdots.png" -r 91190 -t 2200
