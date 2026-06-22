hl.on("hyprland.start", function()
    -- Clipboard history
    hl.exec_cmd("wl-paste --watch cliphist store")
    -- Background daemon
    hl.exec_cmd("awww-daemon")
    -- D-Bus sync
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
