#!/usr/bin/bash

killall waybar

if [[ $USER = "z4na14" ]]
then
    waybar -c ~/.config/waybar/config & -s ~/.config/waybar/style.css
else
    waybar &
fi
