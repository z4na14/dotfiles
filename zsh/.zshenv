cowsay -f pikachu i use arch btw
alias ls='lsd -a'
alias cat='bat'
alias please='sudo'
alias '33'='nano'
alias ld='lazydocker'
alias get_idf='. /home/z4na14/Documentos/esp-idf/export.sh'
alias mv='mvg --progress-bar'
alias cp='cpg --progress-bar'
alias df='duf'
alias du='dust'
alias cmm='history 0 | grep'
alias sybau='Syyu'
alias open='xdg-open'

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

