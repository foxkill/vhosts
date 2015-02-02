#!/bin/bash
cd "$(dirname "$0")"

SRC_DIR=/etc/apache2/vhosts.d/.
DST_DIR=.

function doIt() {
	rsync --delete --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" --exclude "README.md" -av $SRC_DIR $DST_DIR
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi

unset doIt
