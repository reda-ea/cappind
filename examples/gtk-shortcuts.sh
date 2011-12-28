#!/bin/bash

FILEMANAGER="xdg-open"

(echo "Home Folder
Documents
Downloads
Pictures
Music
Videos
"
cat $HOME/.gtk-bookmarks | cut -f1 -d' ' |
	while read s; do basename $s | sed "s/%20/ /g"; done
) | cappind -p -i nautilus -l Places | while read s; do
case "$s" in
Home\ Folder ) $FILEMANAGER ~/ & ;;
Documents ) $FILEMANAGER ~/Documents/ & ;;
Downloads ) $FILEMANAGER ~/Downloads/ & ;;
Pictures ) $FILEMANAGER ~/Pictures/ & ;;
Music ) $FILEMANAGER ~/Music/ & ;;
Videos ) $FILEMANAGER ~/Videos/ & ;;
* )
	$FILEMANAGER `cat $HOME/.gtk-bookmarks | cut -f1 -d' ' |
		while read t; do echo "\`basename $t  | sed \"s/%20/ /g\"\`/$t"; done | grep "^$s" |
		cut -d/ -f2-` &
	;;
esac
done
