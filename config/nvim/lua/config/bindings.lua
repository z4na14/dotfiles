local map = vim.keymap.set

-- ----------------------------------------------------------------------------
-- Exit to Normal mode
-- ----------------------------------------------------------------------------
map({ 'i', 'v' }, 'lk', '<esc>', { desc = 'Exit to Normal mode' })

-- ----------------------------------------------------------------------------
-- Clipboard: use system clipboard for all buffers
-- ----------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
    pattern = '*',
    callback = function()
        vim.opt.clipboard = 'unnamedplus'
    end,
})

-- ----------------------------------------------------------------------------
-- Window Navigation
-- (Ctrl+w h/j/k/l/v/s/q/= are Neovim defaults; mapped explicitly here only
-- so they're documented alongside everything else in this file)
-- ----------------------------------------------------------------------------
map('n', '<C-w>h', '<C-w>h', { desc = 'Move to left split' })
map('n', '<C-w>j', '<C-w>j', { desc = 'Move to split below' })
map('n', '<C-w>k', '<C-w>k', { desc = 'Move to split above' })
map('n', '<C-w>l', '<C-w>l', { desc = 'Move to right split' })
map('n', '<C-w>v', '<C-w>v', { desc = 'Vertical split' })
map('n', '<C-w>s', '<C-w>s', { desc = 'Horizontal split' })
map('n', '<C-w>q', '<C-w>q', { desc = 'Close current split' })
map('n', '<C-w>=', '<C-w>=', { desc = 'Equalize split sizes' })

-- ----------------------------------------------------------------------------
-- Window Resize
-- ----------------------------------------------------------------------------
map('n', '<C-w>+', '<C-w>+', { desc = 'Increase height' })
map('n', '<C-w>-', '<C-w>-', { desc = 'Decrease height' })
map('n', '<C-w>>', '<C-w>>', { desc = 'Increase width' })
map('n', '<C-w><', '<C-w><', { desc = 'Decrease width' })
map('n', '<C-w>_', '<C-w>_', { desc = 'Maximize height' })
map('n', '<C-w>|', '<C-w>|', { desc = 'Maximize width' })

-- Resize with Ctrl+w then Ctrl+Arrow (not a Neovim default; step size in columns/lines)
map('n', '<C-w><C-Left>', '<C-w>5<', { desc = 'Decrease width' })
map('n', '<C-w><C-Right>', '<C-w>5>', { desc = 'Increase width' })
map('n', '<C-w><C-Up>', '<C-w>3+', { desc = 'Increase height' })
map('n', '<C-w><C-Down>', '<C-w>3-', { desc = 'Decrease height' })

-- ----------------------------------------------------------------------------
-- Word Jump (Normal / Visual / Insert)
-- ----------------------------------------------------------------------------
map({ 'n', 'v' }, '<C-Right>', 'w', { desc = 'Jump forward one word' })
map({ 'n', 'v' }, '<C-Left>', 'b', { desc = 'Jump backward one word' })
map({ 'n', 'v' }, '<C-l>', 'w', { desc = 'Jump forward one word' })
map({ 'n', 'v' }, '<C-h>', 'b', { desc = 'Jump backward one word' })
map('i', '<C-Right>', '<S-Right>', { desc = 'Jump forward one word' })
map('i', '<C-Left>', '<S-Left>', { desc = 'Jump backward one word' })

-- ----------------------------------------------------------------------------
-- Scroll View Vertically (cursor stays on its line)
-- ----------------------------------------------------------------------------
map({ 'n', 'v' }, '<C-Down>', '<C-e>', { desc = 'Scroll view down' })
map({ 'n', 'v' }, '<C-Up>', '<C-y>', { desc = 'Scroll view up' })
map({ 'n', 'v' }, '<C-j>', '<C-e>', { desc = 'Scroll view down' })
map({ 'n', 'v' }, '<C-k>', '<C-y>', { desc = 'Scroll view up' })
map('i', '<C-Down>', '<C-o><C-e>', { desc = 'Scroll view down' })
map('i', '<C-Up>', '<C-o><C-y>', { desc = 'Scroll view up' })
map('i', '<C-j>', '<C-o><C-e>', { desc = 'Scroll view down' })
map('i', '<C-k>', '<C-o><C-y>', { desc = 'Scroll view up' })

-- ----------------------------------------------------------------------------
-- Scroll View Horizontally (when content overflows)
-- ----------------------------------------------------------------------------
map({ 'n', 'v' }, '<A-Right>', 'zl', { desc = 'Scroll view right' })
map({ 'n', 'v' }, '<A-Left>', 'zh', { desc = 'Scroll view left' })
map({ 'n', 'v' }, '<A-l>', 'zl', { desc = 'Scroll view right' })
map({ 'n', 'v' }, '<A-h>', 'zh', { desc = 'Scroll view left' })
map('i', '<A-Right>', '<C-o>zl', { desc = 'Scroll view right' })
map('i', '<A-Left>', '<C-o>zh', { desc = 'Scroll view left' })
map('i', '<A-l>', '<C-o>zl', { desc = 'Scroll view right' })
map('i', '<A-h>', '<C-o>zh', { desc = 'Scroll view left' })

-- ----------------------------------------------------------------------------
-- Move Line / Selection
-- ----------------------------------------------------------------------------
map('n', '<A-Up>', ':move .-2<CR>==', { desc = 'Move line up' })
map('n', '<A-Down>', ':move .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', ':move .-2<CR>==', { desc = 'Move line up' })
map('n', '<A-j>', ':move .+1<CR>==', { desc = 'Move line down' })
map('v', '<A-Up>', ":move '<-2<CR>gv=gv", { desc = 'Move selection up' })
map('v', '<A-Down>', ":move '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', ":move '<-2<CR>gv=gv", { desc = 'Move selection up' })
map('v', '<A-j>', ":move '>+1<CR>gv=gv", { desc = 'Move selection down' })

-- ----------------------------------------------------------------------------
-- Search & Replace
-- ----------------------------------------------------------------------------
map('n', '<C-f>', '/', { desc = 'Search' })
map('i', '<C-f>', '<C-o>/', { desc = 'Search' })
map('n', '<C-r>', ':%s/', { desc = 'Find and replace' })
map('i', '<C-r>', '<C-o>:%s/', { desc = 'Find and replace' })
map('v', '<C-r>', ':s/', { desc = 'Find and replace (in selection)' })
map('n', 'U', '<C-r>', { desc = 'Redo' })

-- ----------------------------------------------------------------------------
-- Buffers
-- ----------------------------------------------------------------------------
map('n', '<C-q>', ':bp<bar>bd #<CR>', { desc = 'Close buffer, keep window layout' })
map('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', ':bprev<CR>', { desc = 'Previous buffer' })

-- ----------------------------------------------------------------------------
-- Diagnostics (native vim.diagnostic API, not tied to a plugin)
-- ----------------------------------------------------------------------------
map('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show diagnostic under cursor' })
map('n', '<leader>dj', vim.diagnostic.goto_next, { desc = 'Jump to next diagnostic' })
map('n', '<leader>dk', vim.diagnostic.goto_prev, { desc = 'Jump to previous diagnostic' })
map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Diagnostics to location list' })

-- ----------------------------------------------------------------------------
-- Insert Mode Extras
-- ----------------------------------------------------------------------------
map('i', '<C-BS>', '<C-w>', { desc = 'Delete word backward' })
map('i', '<C-h>', '<C-w>', { desc = 'Delete word backward (fallback for terminal ^H)' })
map('i', '<Del>', '<Del>', { desc = 'Delete character forward' })
map('i', '<C-Del>', '<C-o>de', { desc = 'Delete word forward' })
map('i', '<C-z>', '<C-o>u', { desc = 'Undo without leaving Insert' })
map('i', '<C-S-z>', '<C-o><C-r>', { desc = 'Redo without leaving Insert' })

-- ----------------------------------------------------------------------------
-- Duplicate Line / Selection
-- ----------------------------------------------------------------------------
map('i', '<C-d>', function()
    local line = vim.api.nvim_get_current_line()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_lines(0, row, row, false, { line })
    vim.api.nvim_win_set_cursor(0, { row + 1, col })
end, { desc = 'Duplicate line' })

map('v', '<C-d>', function()
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
    vim.api.nvim_buf_set_lines(0, end_line, end_line, false, lines)
    vim.api.nvim_win_set_cursor(0, { end_line + #lines, 0 })
end, { desc = 'Duplicate selection' })

-- ----------------------------------------------------------------------------
-- Command-line Mode
-- ----------------------------------------------------------------------------
map('c', '<C-Right>', '<S-Right>', { desc = 'Jump forward one word' })
map('c', '<C-Left>', '<S-Left>', { desc = 'Jump backward one word' })
map('c', '<C-BS>', '<C-w>', { desc = 'Delete word backward' })
map('c', '<C-h>', '<C-w>', { desc = 'Delete word backward' })
