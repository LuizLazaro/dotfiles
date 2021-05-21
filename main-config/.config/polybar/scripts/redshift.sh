#!/bin/bash
# Turn on/off redshift

if [ "$(pgrep -x redshift)" ]; then

    if [ "$1" == "--toggle" ]; then
        notify-send --hint=string:x-dunst-stack-tag:redshift "Redshift" "off"
        killall redshift
    fi

    echo "on"

else
    echo "off"
    if [ "$1" == "--toggle" ]; then
        notify-send --hint=string:x-dunst-stack-tag:redshift "Redshift" "on"
        redshift
    fi
fi
