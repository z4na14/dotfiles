#!/bin/bash

export WAYLAND_DISPLAY=wayland-1
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland

entries="\Uf0343 )  Logout\n\Uf04b2 )  Suspend\n\Uf0709 )  Reboot\n\Uf0425 )  Shutdown"

selected=$(echo -e $entries|wofi --cache-file /dev/null --conf ~/.config/wofi/powermenu/config --style ~/.config/wofi/powermenu/style.css | cut -d')' -f2 | xargs)

case $selected in
  Logout)
    exec hyprctl dispatch exit;;
  Suspend)
    exec systemctl suspend;;
  Reboot)
    exec shutdown -r 0;;
  Shutdown)
    exec shutdown -P 0;;
esac
