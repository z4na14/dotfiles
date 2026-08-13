Complete modified keymap of my custom config:

| Category | Key | Action |
|---|---|---|
| **tmux — Splits** | `Ctrl+a e` | Split pane down (horizontal line) |
| | `Ctrl+a r` | Split pane right (vertical line) |
| | `Ctrl+a x` | Close current pane |
| **tmux — Pane Navigation** | `Ctrl+a ←/→/↑/↓` | Move between panes |
| | `Ctrl+a q` | Show pane numbers (then press number to jump) |
| | `Ctrl+a z` | Zoom/unzoom current pane (fullscreen toggle) |
| | `Ctrl+a {` / `Ctrl+a }` | Swap pane left/right |
| **tmux — Windows (tabs)** | `Ctrl+a c` | Create new window |
| | `Ctrl+a n` / `Ctrl+a p` | Next / previous window |
| | `Ctrl+a 1-9` | Jump to window by number (base-index 1) |
| | `Ctrl+a ,` | Rename current window |
| | `Ctrl+a &` | Close current window |
| **tmux — Sessions** | `Ctrl+a d` | Detach from session |
| | `Ctrl+a s` | List/switch sessions |
| **tmux — Copy Mode** | `Ctrl+a [` | Enter copy/scroll mode |
| | `q` | Exit copy mode |
| **tmux — Mouse** | *(enabled)* | Click to select pane, drag to resize, scroll for copy mode |
| **nvim — Window Navigation** | `Ctrl+w h/j/k/l` | Move between splits |
| | `Ctrl+w v` | Vertical split |
| | `Ctrl+w s` | Horizontal split |
| | `Ctrl+w q` | Close current split |
| | `Ctrl+w =` | Equalize split sizes |
| **nvim — Buffers** | `Tab` | Next buffer (`BufferLineCycleNext`) |
| | `Shift+Tab` | Previous buffer (`BufferLineCyclePrev`) |
| | `:bnext` / `:bprev` | Next / previous buffer (built-in) |
| | `<leader>fb` | Fuzzy-find buffers (Telescope) |
| **nvim — Files** | `<leader>ff` | Find files (Telescope) |
| | `<leader>fg` | Live grep (Telescope) |
| | `<leader>fh` | Search help tags (Telescope) |
| | `:Oil` | Open file explorer (oil.nvim) in current dir |
| | `-` | Go to parent directory (default oil.nvim mapping) |
| **nvim — Git (gitsigns)** | `<leader>gp` | Preview hunk diff |
| | `<leader>gi` | Toggle inline hunk diff |
| | `<leader>gr` | Reset/restore hunk (normal + visual) |
| **nvim — Insert Mode Extras** | `lk` | Exit to Normal mode |
| | `Ctrl+z` / `Ctrl+Shift+z` | Undo / Redo without leaving Insert |
| | `Ctrl+Left/Right` | Jump word backward/forward |
| | `Ctrl+Backspace` | Delete word backward |
