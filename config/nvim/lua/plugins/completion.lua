return {
  'saghen/blink.cmp',
  dependencies = {
    'saghen/blink.lib',
    'rafamadriz/friendly-snippets',
  },
  -- Download pre-built binaries from GitHub releases instead of compiling locally
  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    completion = { documentation = { auto_show = false } },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
  },
}
