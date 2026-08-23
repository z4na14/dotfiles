# z4na14's dotfiles

![screenshot](screenshot.png)

## Keybindings

| Keybinding | Action / Command |
| :--- | :--- |
| `SUPER + SPACE` | Switch to next keyboard layout |
| `SUPER + RETURN` | Launch Terminal (`kitty`) |
| `SUPER + Q` | Close active window |
| `SUPER + M` | Open Power menu script via `fuzzel` |
| `SUPER + L` | Lock screen (`hyprlock`) |
| `SUPER + E` | Launch File Manager (`thunar`) |
| `SUPER + F` | Toggle floating mode on active window |
| `SUPER + R` | Open Application Menu (`fuzzel`) |
| `CTRL + SHIFT + ESCAPE` | Launch System Monitor (`kitty btop`) |
| `SUPER + N` | Launch Wi-Fi / Network Manager (`kitty impala`) |
| `SUPER + P` | Change background (Select via `fuzzel` + `matugen`) |
| `SUPER + SHIFT + P` | Change background (Randomly via `/dev/random` + `matugen`) |
| `SUPER + S` | Screenshot: Select region to clipboard (`grim` + `slurp`) |
| `SUPER + SHIFT + S` | Screenshot: Select region to editor (`grim` + `slurp` + `swappy`) |
| `SUPER + PRINT` | Screenshot: Copy active window to clipboard (`grim`) |
| `PRINT` | Screenshot: Copy focused monitor to clipboard (`grim`) |
| `SUPER + V` | Open Clipboard History via `fuzzel` & `cliphist` |
| `SUPER + Left / Right / Up / Down` | Move window focus |
| `SUPER + Tab` | Cycle between floating windows |
| `SUPER + . (period)` | Fit current window to screen size (scrolling mode) |
| `SUPER + CTRL + Left` | Resize column (`-0.1`) |
| `SUPER + CTRL + Right` | Resize column (`+0.1`) |
| `SUPER + SHIFT + Left` | Swap column left |
| `SUPER + SHIFT + Right` | Swap column right |
| `SUPER + [1-5]` | Switch to Workspace 1 - 5 |
| `SUPER + SHIFT + [1-5]` | Move active window to Workspace 1 - 5 |
| `SUPER + H` | Toggle special workspace (Scratchpad / Magic) |
| `SUPER + SHIFT + H` | Move active window to special workspace |
| `SUPER + Left Mouse Button` | Drag window |
| `SUPER + Right Mouse Button` | Resize window |
| `XF86AudioRaiseVolume` | Raise audio volume (+5%) |
| `XF86AudioLowerVolume` | Lower audio volume (-5%) |
| `XF86AudioMute` | Toggle audio mute |
| `XF86AudioMicMute` | Toggle microphone mute |
| `XF86MonBrightnessUp` | Increase monitor brightness (+5%) |
| `XF86MonBrightnessDown` | Decrease monitor brightness (-5%) |
| `XF86AudioNext` | Media: Next track |
| `XF86AudioPause` | Media: Play / Pause |
| `XF86AudioPlay` | Media: Play / Pause |
| `XF86AudioPrev` | Media: Previous track |

### Dev keybindings

| Category | Key | Action |
|---|---|---|
| tmux - Splits | `Ctrl+a e` | Split pane down (horizontal line) |
| | `Ctrl+a r` | Split pane right (vertical line) |
| | `Ctrl+a x` | Close current pane |
| tmux - Pane Navigation | `Ctrl+a ←/→/↑/↓` | Move between panes |
| | `Ctrl+a q` | Show pane numbers (then press number to jump) |
| | `Ctrl+a z` | Zoom/unzoom current pane |
| | `Ctrl+a {` / `Ctrl+a }` | Swap pane left/right |
| tmux - Windows | `Ctrl+a c` | Create new window |
| | `Ctrl+a n` / `Ctrl+a p` | Next / previous window |
| | `Ctrl+a 1-9` | Jump to window by number |
| | `Ctrl+a ,` | Rename current window |
| | `Ctrl+a &` | Close current window |
| tmux - Sessions | `Ctrl+a d` | Detach from session |
| | `Ctrl+a s` | List/switch sessions |
| tmux - Copy Mode | `Ctrl+a [` | Enter copy/scroll mode |
| | `q` | Exit copy mode |
| tmux - Mouse | *(enabled)* | Click to select pane, drag to resize, scroll for copy mode |
| nvim - Window Navigation | `Ctrl+w h/j/k/l` | Move between splits |
| | `Ctrl+w v` | Vertical split |
| | `Ctrl+w s` | Horizontal split |
| | `Ctrl+w q` | Close current split (window) |
| | `Ctrl+w =` | Equalize split sizes |
| nvim - Window Resize | `Ctrl+w +` | Increase height |
| | `Ctrl+w -` | Decrease height |
| | `Ctrl+w >` | Increase width |
| | `Ctrl+w <` | Decrease width |
| | `Ctrl+w _` | Maximize height |
| | `Ctrl+w \|` | Maximize width |
| nvim - Word Jump (Normal/Visual) | `Ctrl+Right` / `Ctrl+l` | Jump forward one word |
| | `Ctrl+Left` / `Ctrl+h` | Jump backward one word |
| nvim - Scroll View (Normal & Visual, cursor stays) | `Ctrl+Down` / `Ctrl+j` | Scroll view down |
| | `Ctrl+Up` / `Ctrl+k` | Scroll view up |
| nvim - Move Line/Selection (Normal & Visual) | `Alt+Up` / `Alt+k` | Move line/selection up |
| | `Alt+Down` / `Alt+j` | Move line/selection down |
| nvim - Search & Replace | `Ctrl+f` (Normal) | Search (like `/`) |
| | `Ctrl+r` (Normal) | Find and replace (current line) |
| | `Ctrl+r` (Visual) | Find and replace (in selection) |
| nvim - Folding | `<leader>za` | Toggle fold under cursor |
| | `<leader>zo` | Open fold under cursor |
| | `<leader>zc` | Close fold under cursor |
| | `<leader>zr` | Open all folds |
| | `<leader>zm` | Close all folds |
| | `<leader>zj` | Jump to next fold |
| | `<leader>zk` | Jump to previous fold |
| | `<leader>zp` | Peek folded lines under cursor |
| nvim - Buffers | `Ctrl+q` (Normal) | Close current buffer, keep window layout |
| | `Tab` / `Shift+Tab` (Normal) | Next / previous buffer |
| | `<leader>fb` | Fuzzy-find buffers (Telescope) |
| nvim - Files | `<leader>e` | Toggle file explorer (Neo-tree) |
| | `<leader>ff` | Find files (Telescope) |
| | `<leader>fg` | Live grep (Telescope) |
| | `<leader>fh` | Search help tags (Telescope) |
| nvim - Files (Neo-tree window) | `<CR>` | Open file/folder |
| nvim - Git (gitsigns) | `<leader>gp` | Preview hunk diff |
| | `<leader>gi` | Toggle inline hunk diff |
| | `<leader>gr` | Reset/restore hunk (Normal + Visual) |
| nvim - LSP | `<leader>ld` | Go to Definition |
| | `<leader>lD` | Go to Declaration |
| | `<leader>lr` | Find References |
| | `<leader>li` | Go to Implementation |
| | `<leader>lw` | Hover Documentation |
| | `<leader>rn` | Rename Symbol |
| | `<leader>ca` | Code Action |
| nvim - Diagnostics | `<leader>de` | Show diagnostic under cursor |
| | `<leader>dj` | Jump to next diagnostic |
| | `<leader>dk` | Jump to previous diagnostic |
| | `<leader>dq` | Diagnostics to location list |
| nvim - Completion (blink.cmp, Insert) | `Ctrl+Enter` | Show completion menu / accept selected item |
| | `Ctrl+Space` | Hide completion menu |
| | `Tab` | Select next item / snippet forward |
| | `Shift+Tab` | Select previous item / snippet backward |
| nvim - Which-key | `<leader>?` | Show buffer-local keymaps |
| nvim - Insert Mode Extras | `lk` | Exit to Normal mode |
| | `Ctrl+z` / `Ctrl+Shift+z` | Undo / Redo without leaving Insert |
| | `Ctrl+Right/Left` | Jump word forward/backward |
| | `Ctrl+Backspace` / `Ctrl+h` | Delete word backward |
| | `Del` | Delete character forward |
| | `Ctrl+Delete` | Delete word forward |
| | `Ctrl+Down/Up` / `Ctrl+j/k` | Scroll view down/up (keep cursor line) |
| | `Ctrl+f` | Search (like `/`) |
| | `Ctrl+r` | Find and replace (current line) |
| nvim - Insert/Visual Extras | `Ctrl+d` (Insert) | Duplicate current line |
| | `Ctrl+d` (Visual) | Duplicate selected lines |
| nvim - Command-line Mode | `Ctrl+Right/Left` | Jump word forward/backward |
| | `Ctrl+Backspace` / `Ctrl+h` | Delete word backward |

## Prerequisites for apps

### Firefox / Thunderbird

README available inside `~/firefox`, but basically, stylesheets need to be enabled, and required files moved inside the respective folders.

### GTK

`THEME` folders must be installed as systemwide GTK theme, inside `/usr/share/themes`.

### Zed

Theme must be selected inside the config.

### Vesktop

https://github.com/refact0r/midnight-discord

Vesktop client must be installed.

https://github.com/Vencord/Vesktop

Custom client theme must be installed first, so CSS variables are applied correctly.

### Obsidian

Matugen config must point to the user vault.

### OBS

Theme must be selected in the config.

### Steam

https://github.com/kuska1/Material-Theme/

Millenium client must be installed.

https://github.com/SteamClientHomebrew/Millennium

Custom client theme must be installed first, so CSS variables are applied correctly. Also, Color scheme shall be selected in the theme config.
