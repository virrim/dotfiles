[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
export PATH="${PATH}:~/scripts" &
xsetroot -cursor_name left_ptr &
wal -R &
exec bspwm
#exec openbox
