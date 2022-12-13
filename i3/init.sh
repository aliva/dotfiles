#!/bin/bash

export CONFIG_ROOT=~/.config/i3/

for f in $CONFIG_ROOT/init/*.sh
do
   echo $f
   source $f
done
