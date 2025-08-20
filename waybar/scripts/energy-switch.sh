#!/bin/bash

STATE="$HOME/.cache/hyprland-gamemode"
CONF="$HOME/.config/hypr/hyprland.conf"

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
    hyprctl keyword decoration:blur:enabled false >/dev/null
    hyprctl keyword decoration:shadow:enabled false >/dev/null
    hyprctl keyword decoration:active_opacity 1.0 >/dev/null
    hyprctl keyword decoration:inactive_opacity 1.0 >/dev/null
    hyprctl keyword monitor eDP-2,2560x1440@59.95Hz,0x0,1.33 >/dev/null
    swww img --outputs eDP-2 /home/z4na14/Imágenes/Wallpapers/static/wall_1.png --transition-type wipe
elif [[ "$i" -eq 1 ]] || [[ "$i" -eq 2 ]]; then
    hyprctl reload >/dev/null
    swww img --outputs eDP-2 /home/z4na14/Imágenes/Wallpapers/static/wall_2.jpg --transition-type wipe
fi

if [[ "$i" -eq 2 ]]; then
    echo 0 >"$STATE"
    printf '{"text":"%s"}\n' "${ICONS[1]}"
    exit 0
fi

# Save next state & emit icon JSON
i=$((1 - i))
echo "$i" >"$STATE"
printf '{"text":"%s"}\n' "${ICONS[1 - i]}"
