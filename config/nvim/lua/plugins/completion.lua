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
    keymap = {
      preset = 'none',

      ['<leader>cs'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<leader>ch'] = { 'hide' },
      ['<leader>cy'] = { 'select_and_accept' },
      ['<leader>cn'] = { 'select_next', 'fallback' },
      ['<leader>cp'] = { 'select_prev', 'fallback' },
      ['<leader>cf'] = { 'snippet_forward', 'fallback' },
      ['<leader>cb'] = { 'snippet_backward', 'fallback' },
      ['<leader>cu'] = { 'scroll_documentation_up', 'fallback' },
      ['<leader>cd'] = { 'scroll_documentation_down', 'fallback' },

    },
    completion = { documentation = { auto_show = false } },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
  },
}
