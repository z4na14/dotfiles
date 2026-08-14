Complete modified keymap of my custom config:

| Category | Key | Action |
|---|---|---|
| tmux - Splits | `Ctrl+a e` | Split pane down (horizontal line) |
| tmux - Splits | `Ctrl+a r` | Split pane right (vertical line) |
| tmux - Splits | `Ctrl+a x` | Close current pane |
| tmux - Pane Navigation | `Ctrl+a ←/→/↑/↓` | Move between panes |
| tmux - Pane Navigation | `Ctrl+a q` | Show pane numbers (then press number to jump) |
| tmux - Pane Navigation | `Ctrl+a z` | Zoom/unzoom current pane (fullscreen toggle) |
| tmux - Pane Navigation | `Ctrl+a {` / `Ctrl+a }` | Swap pane left/right |
| tmux - Windows | `Ctrl+a c` | Create new window |
| tmux - Windows | `Ctrl+a n` / `Ctrl+a p` | Next / previous window |
| tmux - Windows | `Ctrl+a 1-9` | Jump to window by number |
| tmux - Windows | `Ctrl+a ,` | Rename current window |
| tmux - Windows | `Ctrl+a &` | Close current window |
| tmux - Sessions | `Ctrl+a d` | Detach from session |
| tmux - Sessions | `Ctrl+a s` | List/switch sessions |
| tmux - Copy Mode | `Ctrl+a [` | Enter copy/scroll mode |
| tmux - Copy Mode | `q` | Exit copy mode |
| tmux - Mouse | *(enabled)* | Click to select pane, drag to resize, scroll for copy mode |
| nvim - Window Navigation | `Ctrl+w h/j/k/l` | Move between splits |
| nvim - Window Navigation | `Ctrl+w v` | Vertical split |
| nvim - Window Navigation | `Ctrl+w s` | Horizontal split |
| nvim - Window Navigation | `Ctrl+w q` | Close current split |
| nvim - Window Navigation | `Ctrl+w =` | Equalize split sizes |
| nvim - Window Resize | `Ctrl+w +` | Increase height |
| nvim - Window Resize | `Ctrl+w -` | Decrease height |
| nvim - Window Resize | `Ctrl+w >` | Increase width |
| nvim - Window Resize | `Ctrl+w <` | Decrease width |
| nvim - Window Resize | `Ctrl+w _` | Maximize height |
| nvim - Window Resize | `Ctrl+w \|` | Maximize width |
| nvim - Buffers | `:bnext` / `:bprev` | Next / previous buffer |
| nvim - Buffers | `<leader>fb` | Fuzzy-find buffers (Telescope) |
| nvim - Files | `<leader>ff` | Find files (Telescope) |
| nvim - Files | `<leader>fg` | Live grep (Telescope) |
| nvim - Files | `<leader>fh` | Search help tags (Telescope) |
| nvim - Files | `:Oil` | Open file explorer (oil.nvim) |
| nvim - Files | `-` | Go to parent directory (oil.nvim) |
| nvim - Git (gitsigns) | `<leader>gp` | Preview hunk diff |
| nvim - Git (gitsigns) | `<leader>gi` | Toggle inline hunk diff |
| nvim - Git (gitsigns) | `<leader>gr` | Reset/restore hunk (normal + visual) |
| nvim - LSP | `<leader>ld` | Go to Definition |
| nvim - LSP | `<leader>lD` | Go to Declaration |
| nvim - LSP | `<leader>lr` | Find References |
| nvim - LSP | `<leader>li` | Go to Implementation |
| nvim - LSP | `<leader>lw` | Hover Documentation |
| nvim - LSP | `<leader>rn` | Rename Symbol |
| nvim - LSP | `<leader>ca` | Code Action |
| nvim - Insert Mode Extras | `lk` | Exit to Normal mode |
| nvim - Insert Mode Extras | `Ctrl+z` / `Ctrl+Shift+z` | Undo / Redo without leaving Insert |
| nvim - Insert Mode Extras | `Ctrl+Left/Right` | Jump word backward/forward |
| nvim - Insert Mode Extras | `Ctrl+Backspace` | Delete word backward |
