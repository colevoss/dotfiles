fpath=($HOME/.zsh/zsh-completions/src $fpath)
fpath=($HOME/.zsh/custom-completions $fpath)

# export CLICOLOR=1
# export LSCOLORS="EHfxcxdxBxegecabagacad" 
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


# This is done in the main zshrc
# zmodload zsh/complist
# autoload -Uz compinit; compinit

# Speed up autocomplete, force prefix mapping
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
# zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LSCOLORS}")';

# activate approximate completion, but only after regular completion (_complete)
zstyle ':completion:::::' completer _complete _approximate
# limit to 2 errors
zstyle ':completion:*:approximate:*' max-errors 2
# or to have a better heuristic, by allowing one error per 3 character typed
zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

_comp_options+=(globdots)		# Include hidden files.
