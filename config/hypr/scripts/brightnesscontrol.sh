#!/usr/bin/env sh

ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/GlobalControl.sh

function print_error
{
cat << "EOF"
    ./brightnesscontrol.sh <action>
    ...valid actions are...
        i -- <i>ncrease brightness [+5%]
        d -- <d>ecrease brightness [-5%]
EOF
}

function get_brightness {
    brightnessctl -m | grep -o '[0-9]\+%' | head -c-2
}

case $1 in
i)  # increase the backlight
    if [[ $(get_brightness) -lt 10 ]] ; then
        # increase the backlight by 1% if less than 10%
        ags run-js 'brightness.screen_value += 0.05; indicator.popup(1);'

    else
        # increase the backlight by 5% otherwise
        ags run-js 'brightness.screen_value += 0.05; indicator.popup(1);'
    fi
    ;;
d)  # decrease the backlight
    if [[ $(get_brightness) -le 10 ]] ; then
        # avoid 0% brightness
        ags run-js 'brightness.screen_value = 0.05; indicator.popup(1);'
    else
        # decrease the backlight by 5% otherwise
        # swayosd-client --brightness lower
        ags run-js 'brightness.screen_value -= 0.05; indicator.popup(1);'
    fi
    ;;
*)  # print error
    print_error ;;
esac

