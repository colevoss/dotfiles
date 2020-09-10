# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="dracula"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git zsh-syntax-highlighting zsh-autosuggestions kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

DOTFILES="$HOME/dotfiles"

# source $f

for file in $DOTFILES/vars/**/*.vars.sh; do
  source ${file} 
done

for file in $DOTFILES/aliases/**/*.alias.sh; do
  source ${file}
done

# source $DOTFILES/vars/other.private.vars.sh


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias reloadzsh="source $HOME/.zshrc"

# ###########################
# Set up NVM
# ###########################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cvoss/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cvoss/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cvoss/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cvoss/google-cloud-sdk/completion.zsh.inc'; fi
