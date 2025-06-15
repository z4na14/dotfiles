#!/usr/bin/env bash
STATE="$HOME/.cache/hyprland-gamemode"

# Icons for states
ICONS=( )

# Ensure state file exists
mkdir -p "$(dirname "$STATE")"
if [[ ! -f "$STATE" ]]; then echo 0 >"$STATE"; fi

i=$(<"$STATE")

# Toggle mode
if [[ "$i" -eq 0 ]]; then
    hyprctl keyword animations:enabled 0 >/dev/null
    hyprctl keyword windowrulev2 "noanim,floating:1" >/dev/null
    notify-send "Hyprland" "Performance Mode On"
else
    hyprctl reload >/dev/null
    notify-send "Hyprland" "Performance Mode Off"
fi

# Save next state & emit icon JSON
i=$((1 - i))
echo "$i" >"$STATE"
printf '{"text":"%s"}\n' "${ICONS[1 - i]}"