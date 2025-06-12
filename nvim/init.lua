vim.keymap.set({"i", "v"}, "ñl", "<esc>")
vim.api.nvim_create_autocmd({'BufReadPost','BufNewFile'}, {
  pattern = '*',
  callback = function()
    vim.opt.clipboard = 'unnamedplus'
  end,
})

