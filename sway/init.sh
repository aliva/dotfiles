#!/bin/bash

export CONFIG_ROOT=~/.config/sway/

for f in $CONFIG_ROOT/init/*.sh
do
   echo $f
   source $f
done
