#!/usr/bin/env bash

options="󰐥 Power Off\n󰜉 Reboot\n󰤄 Suspend\n󰗽 Log Out\n󰘚 Lock Screen"
chosen=$(echo -e "$options" | fuzzel -d -p "System: " -l 5 --width=20 --hide-prompt)

case "$chosen" in
    *Power*)
        systemctl poweroff
        ;;
    *Reboot*)
        systemctl reboot
        ;;
    *Suspend*)
        systemctl suspend
        ;;
    *Log*)
        # Safely exits your Wayland compositor (works for Hyprland, Sway, etc.)
        loginctl terminate-user "$USER"
        ;;
    *Lock*)
        hyprlock
        ;;
esac
