#!/bin/bash

export DISPLAY=:0
export power=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | \
    grep percentage | cut -d: -f 2 | xargs | cut -d% -f1 | xargs`

if [[ power -lt 20 ]]
then
    notify-send --icon=battery-low "$power% Battery" --expire-time=1
fi
