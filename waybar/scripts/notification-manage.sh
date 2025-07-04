#!/bin/bash

STATE="$HOME/.cache/hyprland-notification"

ICONS=( )

# Ensure state file exists
mkdir -p "$(dirname "$STATE")"
if [[ ! -f "$STATE" ]]; then echo 0 >"$STATE"; fi

i=$(<"$STATE")

# Toggle mode
if [[ "$i" -eq 1 ]]; then
	makoctl mode -s dnd > /dev/null
	pkill hypridle > /dev/null
elif [[ "$i" -eq 0 ]]; then
	makoctl mode -r dnd  > /dev/null
	hypridle > /dev/null &
fi

if [[ "$i" -eq 2 ]]; then
    echo 0 >"$STATE"
    printf '{"text":"%s"}\n' "${ICONS[0]}"
    exit 0
fi

# Save next state & emit icon JSON
i=$((1 - i))
echo "$i" >"$STATE"
printf '{"text":"%s"}\n' "${ICONS[1 - i]}"
