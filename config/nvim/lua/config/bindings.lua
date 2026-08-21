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

-- Duplicate current line (Insert mode), keeps cursor in place, stays in Insert mode
map('i', '<C-d>', function()
  local line = vim.api.nvim_get_current_line()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_lines(0, row, row, false, { line })
  vim.api.nvim_win_set_cursor(0, { row + 1, col })
end, { desc = 'Duplicate line' })

-- Duplicate selected lines (Visual mode), places duplicate below selection
map('v', '<C-d>', function()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  vim.api.nvim_buf_set_lines(0, end_line, end_line, false, lines)
  vim.api.nvim_win_set_cursor(0, { end_line + #lines, col or 0 })
end, { desc = 'Duplicate selection' })

map('n', '<C-q>', ':bp<bar>bd #<CR>', { desc = 'Close buffer, keep window layout' })
