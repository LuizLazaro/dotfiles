# Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#source ~/.zshrc &
sh $HOME/.fehbg &
fcitx5 -d &
mpd &
picom --experimental-backends &
redshift &
dunst &
unclutter &
conky &

exec bspwm
#exec gnome-session
