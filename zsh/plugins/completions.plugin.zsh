fpath=($HOME/.zsh/zsh-completions/src $fpath)
fpath=($HOME/.zsh/custom-completions $fpath)

zmodload zsh/complist
autoload -Uz compinit; compinit

# formatting and messages
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select

# activate approximate completion, but only after regular completion (_complete)
zstyle ':completion:::::' completer _complete _approximate
# limit to 2 errors
zstyle ':completion:*:approximate:*' max-errors 2
# or to have a better heuristic, by allowing one error per 3 character typed
# zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'



# zstyle ':completion:*' completer _extensions _complete _approximate
# zstyle ':completion:*' menu select
# zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
# zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
# zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
# zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
# zstyle ':completion:*' file-list all
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


## completion system
# zstyle ':completion:*:approximate:'                 max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )' # allow one error for every three characters typed in approximate completer
# zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~' # don't complete backup files as executables
# zstyle ':completion:*:correct:*'                    insert-unambiguous true             # start menu completion only if it could find no unambiguous initial string
# zstyle ':completion:*:corrections'                  format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}' #
# zstyle ':completion:*:correct:*'                    original true                       #
# zstyle ':completion:*:default'                      list-colors ${(s.:.)LS_COLORS}      # activate color-completion(!)
# zstyle ':completion:*:descriptions'                 format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'  # format on completion
# zstyle ':completion:*:*:cd:*:directory-stack'       menu yes select              # complete 'cd -<tab>' with menu
# zstyle ':completion:*:expand:*'                     tag-order all-expansions            # insert all expansions for expand completer
# zstyle ':completion:*:history-words'                list false                          #
# zstyle ':completion:*:history-words'                menu yes                            # activate menu
# zstyle ':completion:*:history-words'                remove-all-dups yes                 # ignore duplicate entries
# zstyle ':completion:*:history-words'                stop yes                            #
# zstyle ':completion:*'                              matcher-list 'm:{a-z}={A-Z}'        # match uppercase from lowercase
# zstyle ':completion:*:matches'                      group 'yes'                         # separate matches into groups
# zstyle ':completion:*'                              group-name ''
# if [[ -z "$NOMENU" ]] ; then
#   zstyle ':completion:*'                            menu select=2                       # if there are more than 5 options allow selecting from a menu
# else
#   setopt no_auto_menu # don't use any menus at all
# fi
# zstyle -e ':completion:*'                           special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'
# zstyle ':completion:*:messages'                     format '%d'                         #
# zstyle ':completion:*:options'                      auto-description '%d'               #
# zstyle ':completion:*:options'                      description 'yes'                   # describe options in full
# zstyle ':completion:*:processes'                    command 'ps -au$USER'               # on processes completion complete all user processes
# zstyle ':completion:*:*:-subscript-:*'              tag-order indexes parameters        # offer indexes before parameters in subscripts
# zstyle ':completion:*'                              verbose true                        # provide verbose completion information
# zstyle ':completion:*:warnings'                     format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d' # set format for warnings
# zstyle ':completion:*:*:zcompile:*'                 ignored-patterns '(*~|*.zwc)'       # define files to ignore for zcompile
# zstyle ':completion:correct:'                       prompt 'correct to: %e'             #
# zstyle ':completion::(^approximate*):*:functions'   ignored-patterns '_*'    # Ignore completion functions for commands you don't have:
#
# # complete manual by their section
# zstyle ':completion:*:manuals'                      separate-sections true
# zstyle ':completion:*:manuals.*'                    insert-sections   true
# zstyle ':completion:*:man:*'                        menu yes select
#

_comp_options+=(globdots)		# Include hidden files.
