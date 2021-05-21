# run startx automatically on tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
