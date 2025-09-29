return {
    { "catppuccin/nvim", name = "catppuccin", lazy = false },

    -- Configure LazyVim to load colorscheme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
    {
        "catppuccin/nvim",
        opts = function(_, opts)
            local module = require("catppuccin.groups.integrations.bufferline")
            if module then
                module.get = module.get_theme
            end
            return opts
        end,
    },
}
