if [ -x ~/bin/slstatus ]
then
  ~/bin/slstatus &
fi

picom -f &
fcitx5 &

exec dwm
