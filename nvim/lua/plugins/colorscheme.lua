return {
    { "catppuccin/nvim", name = "catppuccin", lazy = false },

    -- Configure LazyVim to load colorscheme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
