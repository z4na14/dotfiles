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

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local buf = args.buf
          local map = vim.keymap.set

          map('n', '<leader>ld', vim.lsp.buf.definition, { buffer = buf, desc = 'Go to Definition' })
          map('n', '<leader>lD', vim.lsp.buf.declaration, { buffer = buf, desc = 'Go to Declaration' })
          map('n', '<leader>lr', vim.lsp.buf.references, { buffer = buf, desc = 'Find References' })
          map('n', '<leader>li', vim.lsp.buf.implementation, { buffer = buf, desc = 'Go to Implementation' })
          map('n', '<leader>lw', vim.lsp.buf.hover, { buffer = buf, desc = 'Hover Documentation' })
          map('n', '<leader>rn', vim.lsp.buf.rename, { buffer = buf, desc = 'Rename Symbol' })
          map('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = buf, desc = 'Code Action' })
        end,
      })
    end,
  },
}
