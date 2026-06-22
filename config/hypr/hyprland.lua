require("modules/env_vars")
require("modules/autostart")
require("modules/decoration")
require("modules/input")
require("modules/keybindings")

-- Monitors
hl.monitor({ output = "DP-2",    mode = "1920x1080@130Hz", position = "0x0",     scale = 1 })
hl.monitor({ output = "DP-1",    mode = "1920x1080@130Hz", position = "-1920x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", disabled = true })
