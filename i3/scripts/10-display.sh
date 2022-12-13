#!/bin/bash

LID_STATE=`cat /proc/acpi/button/lid/LID/state  | cut -d ':' -f 2 | xargs`

PRIMARY="eDP-1"
EXT_1="DP-1-2"

if [ $LID_STATE = "closed" ]
then
    xrandr \
        --output $EXT_1 --mode '3840x2160' --rate 59.97 \
        --output $PRIMARY --off

else
    xrandr \
        --output $EXT_1 --mode '3840x2160' --rate 59.97 \
        --left-of $PRIMARY
fi

