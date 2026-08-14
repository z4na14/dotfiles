-- Insert Mode Keybindings
local map = vim.keymap.set

vim.opt.number = true
vim.opt.relativenumber = true

-- "lk" to exit any mode
map({ "i", "v" }, "lk", "<esc>")
-- Set up copy-paste buffer to the one from the system
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    pattern = "*",
    callback = function()
        vim.opt.clipboard = "unnamedplus"
    end,
})

-- Ctrl + Left / Right to jump words forward/backward
map('i', '<C-Right>', '<S-Right>', { desc = 'Jump forward one word' })
map('i', '<C-Left>',  '<S-Left>',  { desc = 'Jump backward one word' })

-- Ctrl + Backspace to delete previous word (^H is often received as <C-BS> or <C-h>)
map('i', '<C-BS>', '<C-w>', { desc = 'Delete word backward' })
map('i', '<C-h>',  '<C-w>', { desc = 'Delete word backward (fallback for terminal ^H)' })

-- Delete key (Supr) to delete character under cursor
map('i', '<Del>', '<Del>', { desc = 'Delete character forward' })

-- Ctrl + Delete to delete next word
map('i', '<C-Del>', '<C-o>de', { desc = 'Delete word forward' })

-- Command-line Mode Keybindings
map('c', '<C-Right>', '<S-Right>')
map('c', '<C-Left>',  '<S-Left>')
map('c', '<C-BS>',    '<C-w>')
map('c', '<C-h>',     '<C-w>')

map('i', '<C-z>', '<C-o>u', { desc = 'Undo in insert mode' })
map('i', '<C-S-z>', '<C-o><C-r>', { desc = 'Redo in insert mode' })

-- Buffer switching
map('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', ':bprev<CR>', { desc = 'Previous buffer' })

-- Diagnostics
map('n', '<leader>de', vim.diagnostic.open_float, { buffer = buf, desc = 'Show Diagnostic' })
map('n', '<leader>dj', vim.diagnostic.goto_next, { buffer = buf, desc = 'Next Diagnostic' })
map('n', '<leader>dk', vim.diagnostic.goto_prev, { buffer = buf, desc = 'Previous Diagnostic' })
map('n', '<leader>dq', vim.diagnostic.setloclist, { buffer = buf, desc = 'Diagnostics to Loclist' })
