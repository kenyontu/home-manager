if [ -x ~/bin/slstatus ]
then
  ~/bin/slstatus &
fi

picom -f &

exec dwm
