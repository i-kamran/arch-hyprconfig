# Define the PATH to include custom directories
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme settings
# Set the theme to load; 'random' will pick a random theme each time
ZSH_THEME="robbyrussell"
# List of themes to choose from if ZSH_THEME=random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Completion settings
# Uncomment to enable case-sensitive completion
# CASE_SENSITIVE="true"
# Uncomment to make '_' and '-' interchangeable in completion
# HYPHEN_INSENSITIVE="true"

# Oh My Zsh auto-update settings
# Uncomment to disable auto-updates or set reminder frequency
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically
# zstyle ':omz:update' mode reminder  # remind to update
# zstyle ':omz:update' frequency 13   # update every 13 days

# Miscellaneous settings
# Uncomment to disable magic functions
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment to disable ls colors
# DISABLE_LS_COLORS="true"
# Uncomment to disable auto-setting of terminal title
# DISABLE_AUTO_TITLE="true"
# Uncomment to enable command auto-correction
# ENABLE_CORRECTION="true"
# Uncomment to change the display of completion waiting dots
# COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Uncomment to disable marking untracked files as dirty in VCS
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# History settings
# Set the format for history timestamps
# HIST_STAMPS="mm/dd/yyyy"

# Custom folder for Oh My Zsh
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins to load
# Standard plugins are in $ZSH/plugins/
# Custom plugins can be added to $ZSH_CUSTOM/plugins/
plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting web-search copyfile copybuffer dirhistory history)

# Source Oh My Zsh and fzf (fuzzy finder) for Zsh
source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

# Custom functions
# Compile a C file with clang
cl() {
    if [ -z "$1" ]; then
        echo "Usage: cl <filename>"
        return 1
    fi

    local filename="${1%.c}"
    clang -o "$filename" "$1"
}

# Spellcheck a word using aspell and fzf for selection
spellcheck() {
    echo "$1" | tr ' ' '\n' | aspell list | fzf
}

# User configuration
# MANPATH can be manually set if needed
# export MANPATH="/usr/local/man:$MANPATH"
# Set the language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# Use 'vim' for remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags for architecture
# export ARCHFLAGS="-arch $(uname -m)"

# Personal aliases
alias c="code"                           # Open VS Code
alias t="touch"                          # Create a new file
alias cx="clear"                         # Clear terminal
alias n="nvim"                           # Open Neovim
alias cs="~/.config/auto_commit.sh"

# Zsh configuration management
alias zshconfig="code ~/.zshrc"                                        # Edit Zsh configuration
alias in='nvim $(fzf -m --preview="bat --color=always {}")'            # Open file with fzf preview
alias sudoin='sudo nvim $(fzf -m --preview="bat --color=always {}")'   # Edit file with sudo and fzf preview
alias re="source ~/.zshrc"                                             # Reload Zsh configuration

# History settings
HISTFILE=$HOME/.histfile                 # Save 5000 lines of history
HISTSIZE=5000
SAVEHIST=5000
setopt BANG_HIST                         # Treat '!' specially in history expansion
setopt EXTENDED_HISTORY                  # Write history in detailed format
setopt INC_APPEND_HISTORY                # Append to history file immediately
setopt SHARE_HISTORY                     # Share history across all sessions
setopt HIST_IGNORE_DUPS                  # Ignore duplicate entries
setopt HIST_IGNORE_ALL_DUPS              # Remove older duplicate entries
setopt HIST_IGNORE_SPACE                 # Ignore commands starting with a space

# Custom PATH for additional binaries
PATH=~/.console-ninja/.bin:$PATH

# Initialize additional tools
eval "$(starship init zsh)"              # Starship prompt
eval "$(zoxide init --cmd cd zsh)"       # Zoxide for directory navigation
