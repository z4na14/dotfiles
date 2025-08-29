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

cowsay -f pikachu i use arch btw
alias ls='lsd -a'
alias cat='bat'
alias please='sudo'
alias '33'='nano'
alias ld='lazydocker'
alias get_idf='. /home/z4na14/Documentos/esp-idf/export.sh'

# yays and yayr, for easily installing and removing YAY packages
# mainly stolen and adapted from omarchy and ChrisTitusTech
alias yays="yay -Slq | \
    fzf \
      --multi \
      --preview 'yay -Sii {1}' \
      --preview-label='ctrl-p/n: select; ctrl-u/d: scroll; ctrl-g: PKGBUILD' \
      --preview-label-pos='bottom' \
      --preview-window 'down:65%:wrap' \
      --bind 'ctrl-d:preview-down,ctrl-u:preview-up,ctrl-g:preview:yay -Gp {1} | tail -n +3' \
    | \
    xargs -ro yay -Sy"

alias yayr="yay -Qqe | \
    fzf \
      --multi \
      --preview 'yay -Qi {1}' \
      --preview-label='ctrl-p/n: select; ctrl-u/d: scroll' \
      --preview-window 'down:65%:wrap' \
      --preview-label-pos='bottom' \
      --bind 'ctrl-d:preview-down,ctrl-u:preview-up' \
    | \
    xargs -ro yay -Rns"

export PATH=$PATH:/home/z4na14/.spicetify

# Enable autocomplete (Always at the end)
autoload -Uz compinit
compinit

