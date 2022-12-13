#!/bin/bash

export CONFIG_ROOT=~/.config/i3/

for f in $CONFIG_ROOT/scripts/*.sh
do
   echo $f
   source $f
done
