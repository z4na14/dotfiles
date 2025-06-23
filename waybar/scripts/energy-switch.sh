#!/bin/bash

STATE="$HOME/.cache/hyprland-gamemode"
CONF="$HOME/.config/hypr/hyprland.conf"
MON="HDMI-A-1"

ON_LINE="monitor = $MON , 2560x1440@59.95Hz , 3840x0 , 1"
OFF_LINE="monitor = $MON , disable"

# Icons for states
ICONS=( )

# Ensure state file exists
mkdir -p "$(dirname "$STATE")"
if [[ ! -f "$STATE" ]]; then echo 0 >"$STATE"; fi

i=$(<"$STATE")

# Toggle mode
if [[ "$i" -eq 0 ]]; then
    sed -i -E 's|^monitor *= *HDMI-A-1.*|monitor = HDMI-A-1 , 2560x1440@59.95Hz , 3840x0 , 1|' "$CONF"
    hyprctl keyword animations:enabled 0 >/dev/null
    hyprctl keyword windowrulev2 "noanim,floating:1" >/dev/null
    hyprctl keyword decoration:blur:enabled false >/dev/null
    hyprctl keyword decoration:shadow:enabled false >/dev/null
    swww img --outputs HDMI-A-1,DP-1,DP-2 /home/z4na14/Imágenes/Wallpapers/static/wall_1.png --transition-type wipe
elif [[ "$i" -eq 1 ]] || [[ "$i" -eq 2 ]]; then
    sed -i -E 's|^monitor *= *HDMI-A-1.*|monitor = HDMI-A-1 , disable|' "$CONF"
    hyprctl reload >/dev/null
    swww img --outputs HDMI-A-1,DP-1,DP-2 /home/z4na14/Imágenes/Wallpapers/static/wall_2.jpg --transition-type wipe
fi

if [[ "$i" -eq 2 ]]; then
    echo 1 >"$STATE"
    printf '{"text":"%s"}\n' "${ICONS[1]}"
    exit 0
fi

# Save next state & emit icon JSON
i=$((1 - i))
echo "$i" >"$STATE"
printf '{"text":"%s"}\n' "${ICONS[1 - i]}"
