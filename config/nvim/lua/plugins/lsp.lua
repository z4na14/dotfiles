return {

  -- Autoformatter
  {
    'stevearc/conform.nvim',
    opts = {},
  },


  -- LSP manager
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = true,
  },


  -- LSP handler
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },

    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local servers = {
        "clangd",
        "pyright",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "jsonls",
        "bashls",
      }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
      })

      -- Configure servers using native Neovim 0.11+ API
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
        vim.lsp.enable(server)
      end
    end,
  },
}
