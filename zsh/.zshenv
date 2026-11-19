echo "\n"
if [[ $TERM == "xterm-kitty" ]]; then
	fastfetch --config ~/.config/fastfetch/config-init.jsonc
fi

alias ls='lsd -a'
alias cat='bat'
alias please='sudo'
alias '33'='nano'
alias ld='lazydocker'
alias get_idf='. /home/z4na14/Documentos/esp-idf/export.sh'
alias latex-cmp='latexmk -pdf --output-directory=PDF -aux-directory=AuxDirectory -silent'

alias df='duf'
alias du='dust'

alias cmm='history 0 | grep'
alias sybau='sudo pacman -Syyu'
alias open='xdg-open'
alias copy='wl-copy <'
alias vim='nvim'
alias vi='nvim'

# typos uwu
alias ,,='cd ..'
alias ..l='cd .. && ls'
alias :q='exit'
alias cd..='cd ..'
alias mdkir='mkdir'
alias dc='cd'
alias sl='ls'
alias sudp='sudo'
