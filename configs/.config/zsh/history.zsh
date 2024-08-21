###############
### History ###
###############

HISTFILE=$HOME/.histfile            # Save 5000 lines of history
HISTSIZE=5000
SAVEHIST=5000
setopt BANG_HIST                    # Treat '!' specially in history expansion
setopt EXTENDED_HISTORY             # Write history in detailed format
setopt INC_APPEND_HISTORY           # Append to history file immediately
setopt SHARE_HISTORY                # Share history across all sessions
setopt HIST_IGNORE_DUPS             # Ignore duplicate entries
setopt HIST_IGNORE_ALL_DUPS         # Remove older duplicate entries
setopt HIST_IGNORE_SPACE            # Ignore commands starting with a space