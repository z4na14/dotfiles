Complete modified keymap of my custom config:

| Mode(s) | Key | Maps To / Action | Description |
|---|---|---|---|
| Insert, Visual | `lk` | `<Esc>` | Exit to Normal mode |
| Insert | `<C-Right>` | `<S-Right>` | Jump forward one word |
| Insert | `<C-Left>` | `<S-Left>` | Jump backward one word |
| Insert | `<C-BS>` | `<C-w>` | Delete word backward |
| Insert | `<C-h>` | `<C-w>` | Delete word backward (terminal `^H` fallback) |
| Insert | `<Del>` | `<Del>` | Delete character forward |
| Insert | `<C-Del>` | `<C-o>de` | Delete word forward |
| Insert | `<C-z>` | `<C-o>u` | Undo (without leaving Insert mode) |
| Insert | `<C-S-z>` | `<C-o><C-r>` | Redo (without leaving Insert mode) |
| Command-line | `<C-Right>` | `<S-Right>` | Jump forward one word |
| Command-line | `<C-Left>` | `<S-Left>` | Jump backward one word |
| Command-line | `<C-BS>` | `<C-w>` | Delete word backward |
| Command-line | `<C-h>` | `<C-w>` | Delete word backward (terminal fallback) |
| Normal | `<leader>ff` | `telescope.builtin.find_files()` | Find files |
| Normal | `<leader>fg` | `telescope.builtin.live_grep()` | Live grep search |
| Normal | `<leader>fb` | `telescope.builtin.buffers()` | List open buffers |
| Normal | `<leader>fh` | `telescope.builtin.help_tags()` | Search help tags |
| Normal *(buffer-local, gitsigns)* | `<leader>gp` | `gitsigns.preview_hunk` | Preview hunk diff |
| Normal *(buffer-local, gitsigns)* | `<leader>gi` | `gitsigns.preview_hunk_inline` | Toggle inline hunk diff |
| Normal *(buffer-local, gitsigns)* | `<leader>gr` | `gitsigns.reset_hunk` | Reset/restore hunk under cursor |
| Visual *(buffer-local, gitsigns)* | `<leader>gr` | `gitsigns.reset_hunk({line, v})` | Reset/restore selected lines |

