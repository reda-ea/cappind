#!/bin/bash

#FILE=`mktemp`
#echo $FILE

#tail -f ~/.cache/notify-osd.log | grep --line-buffered "^\[.*, .* \] .*" > "$FILE" &
#(tail -f -n 0 ~/.cache/notify-osd.log | 
#	while read s; do
#		echo $s | tr '\n' ':' | sed "s/:::*/\n/g" | sed "s/\[.*\] //g" >> "$FILE"
#	done )&
#tail -f -n 0 ~/.cache/notify-osd.log | sed -e :a -e '$!N; s/\n/ /; ta' | sed "s/:::*/\n/g" | sed "s/\[.*\] //g" > "$FILE"

while true; do
	(tail -n 50 ~/.cache/notify-osd.log |
		tr '\n' ':' | sed "s/:::*/\n/g" | #sed "s/\[.*\] //g" |
		sed "s/\[.*\([0-9][0-9]\):\([0-9][0-9]\):\([0-9][0-9]\).*] \(.*\):\(.*\)/(\1.\2.\3) \4:\5/g" |
		tac | head | sed "s/\_/\_\_/g" #sed "s/^[^]]*\] //g" | sed "s/\_/\_\_/g"
	echo ""; echo "_Clear") |
		cappind -t 60 -i info | while read s; do 
		if [[ -n "$s" ]]; then case "$s" in
			_Clear ) echo -n "" > "$FILE" ;;
			* )
				TXT=`echo $s | sed "s/:/\n/g"`
				zenity --info --text "$TXT"
				;;
		esac; fi
	done
done

#rm "$FILE"

