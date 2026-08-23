return {
  'saghen/blink.cmp',
  dependencies = {
    'saghen/blink.lib',
    'rafamadriz/friendly-snippets',
  },
  version = '*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'none',

      ['<C-CR>']    = { 'show', 'select_and_accept' },
      ['<C-space>'] = { 'hide' },
      ['<Tab>']     = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>']   = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    completion = { documentation = { auto_show = false } },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
  },
}
