return {
  "nvim-treesitter/nvim-treesitter",
  
  build = ":TSUpdate",
  lazy = false, -- Load on startup so it compiles/installs cleanly on first boot
  
  config = function()
    local status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end

    treesitter.setup({
      auto_install = true,
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "bash",
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
