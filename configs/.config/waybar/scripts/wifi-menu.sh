#!/bin/bash

function get_networks() {
    nmcli -f SSID,SIGNAL,SECURITY device wifi list | tail -n +2 | sed 's/^ *//g' | sort -k2 -nr
}

function connect_to_network() {
    local ssid="$1"
    local password="$2"
    if [ -n "$password" ]; then
        nmcli device wifi connect "$ssid" password "$password"
    else
        nmcli device wifi connect "$ssid"
    fi
}

function refresh_networks() {
    nmcli device wifi rescan
}

function main() {
    local networks chosen_network ssid security password

    # Get available networks
    networks=$(get_networks)

    # Launch Rofi to select a network
    chosen_network=$(echo -e "$networks\n---\nRefresh Networks" | rofi -dmenu -i -p "Select WiFi Network")

    case "$chosen_network" in
        "Refresh Networks")
            refresh_networks
            main
            ;;
        "")
            exit 0
            ;;
        *)
            if [ -n "$chosen_network" ]; then
                ssid=$(echo "$chosen_network" | awk -F' {2,}' '{print $1}')
                security=$(echo "$chosen_network" | awk -F' {2,}' '{print $3}')
                if [ "$security" != "--" ]; then
                    password=$(rofi -dmenu -password -p "Enter Password for $ssid")
                    connect_to_network "$ssid" "$password"
                else
                    connect_to_network "$ssid"
                fi
            fi
            ;;
    esac

  
}

main