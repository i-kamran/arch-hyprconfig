#!/bin/bash

########################
### Global Packages  ###
########################

# This configuration file defines which AUR helpers,
# code editors, and other tools will be installed.
# It is sourced by the installation script to determine
# what to install.

###################
### AUR Helpers ###
###################
AUR_HELPERS=("paru" "yay")  # AUR helpers for managing Arch User Repository packages


#######################
### Pacman Packages ###
########################

PACKAGES=(
    ################
    ### Browsers ###
    ################
    "firefox"                         # Web browser
    
    ############################
    ### Wayland & Compositor ###
    ############################
    "hyprland"                        # Dynamic tiling Wayland compositor
    "hypridle"                        # Hyprland idle daemon
    "hyprlock"                        # Hyprland screen lock utility
    "mako"                            # Lightweight notification daemon for Wayland
    "waybar"                          # Highly customizable Wayland bar for Sway and Hyprland
    "swww"                            # Wallpaper utility for Hyprland
    "xdg-desktop-portal-hyprland"     # XDG desktop portal backend for Hyprland
    "archlinux-xdg-menu"              # XDG menu for arch, enables 'open with' in dolphin
    "rofi-wayland"                    # Window switcher, application launcher, and dmenu replacement (Wayland)

    #########################
    ### Utilities & Tools ###
    #########################
    "ark"                             # KDE archive manager
    "gwenview"                        # KDE image viewer and organizer with basic editing capabilities
    "stow"                            # Symlink manager for dotfiles
    "mpv"                             # Media player for the command line
    "wget"                            # Utility for downloading files from the web
    "fzf"                             # Command-line fuzzy finder
    "pamixer"                         # PulseAudio mixer command-line interface
    "pavucontrol"                     # PulseAudio Volume Control GUI
    "gvfs"                            # Virtual filesystem implementation for GIO
    "fuse"                            # Filesystem in Userspace (FUSE) support
    "brightnessctl"                   # Utility to control screen brightness
    "btop"                            # Resource monitor (top/htop alternative)
    "fastfetch"                       # Neofetch-like system information tool
    "zoxide"                          # Smarter cd command, a replacement for `cd` command
    "bat"                             # Cat clone with syntax highlighting and Git integration
    "tldr"                            # Simplified and community-driven man pages
    "man"                             # Man pages, the manual documentation reader
    "ripgrep"                         # Ripgrep is a recursive line-oriented search tool
    "zip"                             # Package and compress (archive) files into a Zip archive
    "unzip"                           # Extract files/directories from Zip archives
    "less"                            # Utility to read file contents

    #######################
    ### Display Manager ###
    #######################
    "sddm"                            # Simple Desktop Display Manager (login manager)
    
    ########################
    ### Terminal & Shell ###
    ########################
    "kitty"                           # Fast, feature-rich, GPU-based terminal emulator
    "starship"                        # Cross-shell prompt for astronauts

    ####################
    ### File Manager ###
    ####################
    "dolphin"                         # KDE file manager
    # "thunar"                          # Xfce file manager
    # "tumbler"                         # Generates thumbnails for thunar

    #######################
    ### KDE Integration ###
    #######################
    "polkit-kde-agent"                # Polkit authentication agent for KDE
    "kservice5"                       # KDE service framework
    "kde-cli-tools"                   # Command-line tools for managing KDE settings and applications

    ##################
    ### Qt Support ###
    ##################
    "qt5-wayland"                     # Qt5 Wayland platform integration
    "qt6-wayland"                     # Qt6 Wayland platform integration
    "qt6ct"                           # Qt6 Configuration Tool (configure Qt6 apps)

    ############################
    ### Theming & Appearance ###
    ############################
    "kvantum"                         # SVG-based theme engine for Qt5 and Qt6
    "papirus-icon-theme"              # Icon theme for Linux desktops

    #################
    ### Clipboard ###
    #################
    "grim"                            # Screenshot utility for Wayland
    "slurp"                           # Select an area of the screen interactively (used with grim)
    "cliphist"                        # Clipboard history manager

    #########################
    ### Bluetooth & Wi-Fi ###
    #########################
    "bluez"                           # Official Linux Bluetooth protocol stack
    "bluez-utils"                     # Bluetooth utilities (command-line tools)
    "blueman"                         # GTK+ Bluetooth Manager
    "network-manager-applet"          # GNOME applet for managing network connections

    #############
    ### Fonts ###
    #############
    "ttf-jetbrains-mono-nerd"         # Nerd font patched version of JetBrains Mono
    "ttf-montserrat"                  # Google Montserrat font

    #####################
    ### Miscellaneous ###
    #####################
    "aspell"                          # Spell checker
    "aspell-en"                       # English dictionary for aspell
    "telegram-desktop"                # Telegram messaging app desktop client

    ###########################
    ### Dev Tools & Editors ###
    ###########################
    "neovim"                          # Modern text editor, designed for extensibility and embeddability
    "nodejs"                          # Server-side JavaScript platform
    "npm"                             # JavaScript and Node.js package manager
    "shellcheck"                      # Shell script static analysis tool

    #################
    ### Intel GPU ###
    #################
    "mesa-utils"       # OpenGL utilities
    "vulkan-intel"     # Vulkan drivers for Intel GPUs
)


####################
### AUR Packages ###
####################

AUR_PACKAGES=(
    ###########################
    ### Dev Tools & Editors ###
    ###########################
    "visual-studio-code-bin"          # Binary release of Visual Studio Code
    "noi-desktop-bin"                 # Noi desktop environment installer

    #############
    ### Fonts ###
    #############
    "ttf-ms-fonts"                    # Microsoft TrueType core fonts

    ############################
    ### Wayland & Compositor ###
    ############################
    "wlogout-git"                     # A logout menu for Wayland and X11

    #####################
    ### Plasma Themes ###
    #####################
    "plasma6-themes-layan-git"        # Layan theme for Plasma 6
    "papirus-folders-catppuccin-git"  # Papirus folders Catppuccin theme
    "layan-gtk-theme-git"             # Layan theme for gtk
)
