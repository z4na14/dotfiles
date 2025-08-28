-- lazy.nvim
return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        dashboard = {
            width = 60,
            row = nil, -- dashboard position. nil for center
            col = nil, -- dashboard position. nil for center
            pane_gap = 0, -- empty columns between vertical panes
            autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
            preset = {

                header = [[
███████╗██╗  ██╗███╗   ██╗ █████╗  ██╗██╗  ██╗       ██████╗
╚══███╔╝██║  ██║████╗  ██║██╔══██╗███║██║  ██║    ██╗╚════██╗
  ███╔╝ ███████║██╔██╗ ██║███████║╚██║███████║    ╚═╝ █████╔╝
 ███╔╝  ╚════██║██║╚██╗██║██╔══██║ ██║╚════██║    ██╗ ╚═══██╗
███████╗     ██║██║ ╚████║██║  ██║ ██║     ██║    ╚═╝██████╔╝
╚══════╝     ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═╝     ╚═╝       ╚═════╝
            ]],

                keys = {
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    {
                        icon = " ",
                        key = "/",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    },
                    {
                        icon = "󰒲 ",
                        key = "L",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
    },
}
