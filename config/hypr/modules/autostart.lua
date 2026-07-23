hl.on("hyprland.start", function()
    -- Clipboard history
    hl.exec_cmd("wl-paste --watch cliphist store")
    -- Background daemon
    hl.exec_cmd("awww-daemon")
    -- D-Bus sync
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    -- Theming?
    hl.exec_cmd("systemctl --user import-environment QT_QPA_PLATFORMTHEME")
end)
