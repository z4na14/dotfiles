return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            transparent_background = true,
            integrations = {
                telescope = { enabled = true },
                mason = true,
                neotree = true,
            },
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
