#!/bin/bash

file_networks_list="/tmp/polybar_networks"
nmcli device wifi list  > "$file_networks_list" # save networks in a temporary file
sed -i '1d' "$file_networks_list" # remove file header

networks=$(cat '/tmp/polybar_networks' | cut -c 28- | sed -r 's/\s+[a-zA-Z].+//')
selected_network=$(echo "$networks" | rofi -dmenu -i -theme internet.rasi -p "")

if [ "$selected_network" != "" ]; then 
    pass=$(rofi -show run -dmenu -password -p "Password" -theme internet.rasi)
    echo "$selected_network"
    echo "$pass"
    nmcli device wifi connect "$selected_network" password "$pass"
    exit_code="$?"
    
    if [ $exit_code -eq 0 ]; then
        notify-send --hint=string:x-dunst-stack-tag:internet_connection "Wifi" "Connected to <i>$selected_network</i>!"
    else
        notify-send --hint=string:x-dunst-stack-tag:internet_connection "Wifi" "Not connected to <i>$selected_network</i>!"
    fi
fi

