# PATH to include custom directories and oh-my-zsh
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

###############
### Sources ###
###############

source $HOME/.config/zsh/env.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/functions.zsh
source $HOME/.config/zsh/history.zsh


###############
### Configs ###
###############

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

###############
### Plugins ###
###############

plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting web-search 
copyfile copybuffer dirhistory history copypath)


############
### Misc ###
############

# Source Oh My Zsh and fzf (fuzzy finder) for Zsh
# This oh-my-zsh.sh source should be below plugins
source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

# Initialize additional tools
eval "$(starship init zsh)"             # Starship prompt
eval "$(zoxide init --cmd cd zsh)"      # Zoxide for directory navigation

PATH=~/.console-ninja/.bin:$PATH
