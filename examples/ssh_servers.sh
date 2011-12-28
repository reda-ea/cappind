#!/bin/bash

TERMCMD="x-terminal-emulator"

(cat $HOME/.ssh/config |
	grep "^[Hh]ost\b" |
	sed "s/^[Hh]ost\b\s*//g" |
	sed "s/\_/ /g" && echo && echo "Local Terminal") |
	cappind -p |
	sed -u "s/ /_/g" |
	while read s; do
		if [[ "$s" = "Local_Terminal" ]]; then
			$TERMCMD &
		else
			$TERMCMD -x ssh "$s" &
		fi
	done
