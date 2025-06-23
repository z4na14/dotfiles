-- "ñl" to exit any mode 
vim.keymap.set({"i", "v"}, "ñl", "<esc>")
-- Set up copy-paste buffer to the one from the system
vim.api.nvim_create_autocmd({'BufReadPost','BufNewFile'}, {
  pattern = '*',
  callback = function()
    vim.opt.clipboard = 'unnamedplus'
  end,
})
-- Lazy.nvim bootstrap
require("config.lazy")
