#!/bin/bash

export WAYLAND_DISPLAY=wayland-1
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland

entries="\Uf0343 )  Logout\n\Uf04b2 )  Suspend\n\Uf0709 )  Reboot\n\Uf0425 )  Shutdown"

selected=$(echo -e $entries|wofi --cache-file /dev/null --conf /home/z4na14/.config/wofi/powermenu/config --style ~/.config/wofi/powermenu/style.css | awk '{print tolower($2)}')

case $selected in
  logout)
    exec exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
