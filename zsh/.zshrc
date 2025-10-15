# Enable command history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Add .local/bin to PATH
PATH=$PATH:~/.local/bin

# Loading oh-my-posh
eval "$(oh-my-posh init zsh --config /home/z4na14/.config/oh-my-posh/amro.json)"

# Adding shortcuts for CTRL + Arrows or SUPR
bindkey '\e[1;5C' forward-word       # Ctrl + Right Arrow
bindkey '\e[1;5D' backward-word      # Ctrl + Left Arrow
bindkey '^H' backward-delete-word    # Ctrl + Backspace
bindkey '^[[3~' delete-char          # Delete key (Supr)
bindkey '^[[3;5~' delete-word        # Ctrl + Delete

export PATH=$PATH:/home/z4na14/.spicetify
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Enable autocomplete (Always at the end)
autoload -Uz compinit
compinit

