#! /bin/bash

while true; do
	wmctrl -l |
		grep "0\s*`hostname`" |
		sed "s/.*0\s*`hostname`\s*//g" |
		grep -v "^Desktop$" | grep -v "^compiz$" |
	cappind -p -t 10 -i preferences-system-windows
done | while read s; do
	wmctrl -a "$s";
done
