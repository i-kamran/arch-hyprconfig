####################
### Environments ###
####################
export LANG=en_US.UTF-8
export EDITOR=nvim
export BROWSER=firefox
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NODE_NO_WARNINGS=1
PATH=~/.console-ninja/.bin:$PATH
export PATH=~/.npm-global/bin:$PATH
# Set the language environment

# Preferred editor for local and remote sessions
# Use 'vim' for remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags for architecture
# export ARCHFLAGS="-arch $(uname -m)"
