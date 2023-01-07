LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

# alias lf="lfcd"
bindkey -s '^o' 'lfcd\n'  # zsh
