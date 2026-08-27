-- Insert Mode Keybindings
local map = vim.keymap.set

-- "lk" to exit any mode
map({ "i", "v" }, "lk", "<esc>")

-- Set up copy-paste buffer to the one from the system
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    pattern = "*",
    callback = function()
        vim.opt.clipboard = "unnamedplus"
    end,
})

-- Ctrl + Left / Right to jump words forward/backward (Insert)
map('i', '<C-Right>', '<S-Right>', { desc = 'Jump forward one word' })
map('i', '<C-Left>',  '<S-Left>',  { desc = 'Jump backward one word' })

-- Ctrl + Left / Right to jump words forward/backward (Normal & Visual, arrows)
map({ 'n', 'v' }, '<C-Right>', 'w', { desc = 'Jump forward one word' })
map({ 'n', 'v' }, '<C-Left>',  'b', { desc = 'Jump backward one word' })

-- Ctrl + l / h to jump words forward/backward (Normal & Visual, vim movement keys)
map({ 'n', 'v' }, '<C-l>', 'w', { desc = 'Jump forward one word' })
map({ 'n', 'v' }, '<C-h>', 'b', { desc = 'Jump backward one word' })

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
map('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show Diagnostic' })
map('n', '<leader>dj', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
map('n', '<leader>dk', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Diagnostics to Loclist' })

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

-- Move current line up/down (Normal mode, arrows)
map('n', '<A-Up>',   ':move .-2<CR>==',  { desc = 'Move line up' })
map('n', '<A-Down>', ':move .+1<CR>==',  { desc = 'Move line down' })

-- Move selected lines up/down (Visual mode, arrows)
map('v', '<A-Up>',   ":move '<-2<CR>gv=gv",  { desc = 'Move selection up' })
map('v', '<A-Down>', ":move '>+1<CR>gv=gv",  { desc = 'Move selection down' })

-- Move current line up/down (Normal mode, vim movement keys)
map('n', '<A-k>', ':move .-2<CR>==',  { desc = 'Move line up' })
map('n', '<A-j>', ':move .+1<CR>==',  { desc = 'Move line down' })

-- Move selected lines up/down (Visual mode, vim movement keys)
map('v', '<A-k>', ":move '<-2<CR>gv=gv",  { desc = 'Move selection up' })
map('v', '<A-j>', ":move '>+1<CR>gv=gv",  { desc = 'Move selection down' })

-- Remap Ctrl+r to Ctrl+U for redo 
map('n', 'U', '<C-r>', { desc = 'Redo' })

-- Search (Normal mode)
map('n', '<C-f>', '/', { desc = 'Search' })

-- Search (Insert mode)
map('i', '<C-f>', '<C-o>/', { desc = 'Search' })

-- Find and Replace on current line (Normal mode)
map('n', '<C-r>', ':%s/', { desc = 'Find and Replace (current line)' })

-- Find and Replace on current line (Insert mode)
map('i', '<C-r>', '<C-o>:%s/', { desc = 'Find and Replace (current line)' })

-- Find and Replace within selection (Visual mode)
map('v', '<C-r>', ':s/', { desc = 'Find and Replace in selection' })

-- Scroll view down/up, keep cursor line (Visual mode, arrows)
map('v', '<C-Down>', '<C-e>', { desc = 'Scroll view down (keep cursor line)' })
map('v', '<C-Up>',   '<C-y>', { desc = 'Scroll view up (keep cursor line)' })

-- Scroll view down/up, keep cursor line (Normal mode, arrows)
map('n', '<C-Down>', '<C-e>', { desc = 'Scroll view down (keep cursor line)' })
map('n', '<C-Up>',   '<C-y>', { desc = 'Scroll view up (keep cursor line)' })

-- Scroll view down/up, keep cursor line (Normal mode, vim movement keys)
map('n', '<C-j>', '<C-e>', { desc = 'Scroll view down (keep cursor line)' })
map('n', '<C-k>', '<C-y>', { desc = 'Scroll view up (keep cursor line)' })

-- Scroll view down/up, keep cursor line (Insert mode, arrows)
map('i', '<C-Down>', '<C-o><C-e>', { desc = 'Scroll view down (keep cursor line)' })
map('i', '<C-Up>',   '<C-o><C-y>', { desc = 'Scroll view up (keep cursor line)' })

-- Scroll view down/up, keep cursor line (Insert mode, vim movement keys)
map('i', '<C-j>', '<C-o><C-e>', { desc = 'Scroll view down (keep cursor line)' })
map('i', '<C-k>', '<C-o><C-y>', { desc = 'Scroll view up (keep cursor line)' })

-- Scroll view down/up, keep cursor line (Visual mode, arrows)
map('v', '<C-Down>', '<C-e>', { desc = 'Scroll view down (keep cursor line)' })
map('v', '<C-Up>',   '<C-y>', { desc = 'Scroll view up (keep cursor line)' })

-- Scroll view down/up, keep cursor line (Visual mode, vim movement keys)
map('v', '<C-j>', '<C-e>', { desc = 'Scroll view down (keep cursor line)' })
map('v', '<C-k>', '<C-y>', { desc = 'Scroll view up (keep cursor line)' })

-- Scroll view right/left when content overflows (Normal mode, arrows)
map('n', '<A-Right>', 'zl', { desc = 'Scroll view right' })
map('n', '<A-Left>',  'zh', { desc = 'Scroll view left' })

-- Scroll view right/left when content overflows (Normal mode, vim movement keys)
map('n', '<A-l>', 'zl', { desc = 'Scroll view right' })
map('n', '<A-h>', 'zh', { desc = 'Scroll view left' })

-- Scroll view right/left when content overflows (Insert mode, arrows)
map('i', '<A-Right>', '<C-o>zl', { desc = 'Scroll view right' })
map('i', '<A-Left>',  '<C-o>zh', { desc = 'Scroll view left' })

-- Scroll view right/left when content overflows (Insert mode, vim movement keys)
map('i', '<A-l>', '<C-o>zl', { desc = 'Scroll view right' })
map('i', '<A-h>', '<C-o>zh', { desc = 'Scroll view left' })

-- Scroll view right/left when content overflows (Visual mode, arrows)
map('v', '<A-Right>', 'zl', { desc = 'Scroll view right' })
map('v', '<A-Left>',  'zh', { desc = 'Scroll view left' })

-- Scroll view right/left when content overflows (Visual mode, vim movement keys)
map('v', '<A-l>', 'zl', { desc = 'Scroll view right' })
map('v', '<A-h>', 'zh', { desc = 'Scroll view left' })
