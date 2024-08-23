########################
### Personal aliases ###
########################

alias c="code"                                                                # Open VS Code
alias t="touch"                                                               # Create a new file
alias cx="clear"                                                              # Clear terminal
alias n="nvim"                                                                # Open Neovim
alias cs="~/.config/auto-commit.sh"                                           # Auto commit script
alias chwp="~/.config/change-wallpaper.sh"                                    # Script to change wallpaper
alias addw="~/.config/aspell-add-word.sh"                                     # Script to add words into personal aspell dict
alias dolphinenable="systemctl --user start kbuildsycoca.service"             # Enable dolphin default apps



# Zsh configuration management
alias zshconfig="code ~/.zshrc"                                        # Edit Zsh configuration
alias in='nvim $(fzf -m --preview="bat --color=always {}")'            # Open file with fzf preview
alias sudoin='sudo nvim $(fzf -m --preview="bat --color=always {}")'   # Edit file with sudo and fzf preview
alias re="source ~/.zshrc"                                             # Reload Zsh configuration
alias stowconf="~/arch-hyprconfig/configuration-scripts/stow.sh"
