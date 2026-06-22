local mainMod     = "SUPER"
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "fuzzel"

-- Keyboard layout switch
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))

-- App launchers
hl.bind(mainMod .. " + RETURN",      hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",           hl.dsp.window.close())
--hl.bind(mainMod .. " + M",           hl.dsp.exec_cmd(""))
hl.bind(mainMod .. " + L",           hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + E",           hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F",           hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R",           hl.dsp.exec_cmd(menu))
--hl.bind(mainMod .. " + A",           hl.dsp.exec_cmd("hyprworm"))
hl.bind("CTRL + SHIFT + escape",       hl.dsp.exec_cmd("kitty btop"))

hl.bind(mainMod .. " + P", hl.dsp.exec_cmd('ls ~/Imágenes/wallpapers | fuzzel -d --width=30 -l 8 | sed "s|^|$HOME/Imágenes/wallpapers/|" | xargs -I {} kitty matugen image {}'))

-- Screenshots
-- Select a region and copy directly to clipboard (No Swappy, no file saved)
hl.bind(mainMod .. " + S",           hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
-- Select a region and open in Swappy (Swappy handles both saving and copying)
hl.bind(mainMod .. " + SHIFT + S",   hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"))
-- Capture active window and copy to clipboard
hl.bind(mainMod .. " + PRINT",       hl.dsp.exec_cmd("grim -g \"$(hyprctl activewindow -j | jq -r '\"\\(.at[0]),\\(.at[1]) \\(.size[0])x\\(.size[1])\"')\" - | wl-copy"))
-- Capture current monitor/output and copy to clipboard
hl.bind("PRINT",                     hl.dsp.exec_cmd("grim -o \"$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')\" - | wl-copy"))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(
    "cliphist list | fuzzel --dmenu --width=120 --prompt='❯ ' | cliphist decode | wl-copy"
))

-- Move focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
-- Move between floating windows
hl.bind(mainMod .. " + Tab", hl.dsp.window.cycle_next({ floating = true }))
-- Fit current window to fit the screen size in scrolling mode
hl.bind(mainMod .. " + period", hl.dsp.layout("fit visible"))
-- Resize column
hl.bind(mainMod .. " + CTRL + left", hl.dsp.layout("colresize -0.1"))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.layout("colresize +0.1"))
-- Move columns
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.layout("swapcol r"))

-- Switch / move to workspaces
for i = 1, 5 do
    hl.bind(mainMod .. " + " .. i,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i,   hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + H",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume & brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Media keys
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    { locked = true })
