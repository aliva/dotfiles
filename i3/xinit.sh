#!/bin/bash

set -x

setxkbmap -layout us, -option "grp:win_space_toggle"
xrdb ~/.config/i3/Xresources

# Display
LID_STATE=`cat /proc/acpi/button/lid/LID/state  | cut -d ':' -f 2 | xargs`
LAPTOP_LCD="eDP-1"
EXTERNAL_LCD="DP-1-2"

if [ $LID_STATE = "closed" ]
then
    xrandr \
        --output $EXTERNAL_LCD --mode '3840x2160' --rate 59.97 \
        --output $LAPTOP_LCD --off

else
    xrandr \
        --output $EXTERNAL_LCD --mode '3840x2160' --rate 59.97 \
        --left-of $LAPTOP_LCD
fi

