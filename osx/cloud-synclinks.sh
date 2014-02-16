#!/usr/bin/env bash

##
# Configs to sync various part of folders to different 
# online storage providers
#
# ln syntax is ln -s source dest, must specify dest link name
##

function rmsymlink {
	symlink=$1;
	
	if [ -f "$symlink" ];
	then
		rm "$symlink";
	fi
}

function createsymlink {
	linksource=$1;
	linktarget=$2;
	
	# force, don't follow link (in case its a dir)
	ln -s -h -f "$linksource" "$linktarget";
}

function rmhardlink {
	hardlink=$1;
	
	if [ -f "$hardlink" ] || [ -d "$hardlink" ];
	then
		./hlink -u "$hardlink";
	fi
}

function createhardlink {
	linksource=$1;
	linktarget=$2;

	./hlink "$linksource" "$linktarget";
}


## ubuntu one
# ubuntu one doesn't follow symlinks, either do a hard link or
# add folder to sync from its ui
# currently syncing cdcorp, personal


## Copy
rmsymlink ~/Copy/tools
createsymlink ~/cchou/tools/ ~/Copy/tools
rmsymlink ~/Copy/dev
createsymlink ~/cchou/dev/ ~/Copy/dev

## DropBox
rmsymlink ~/Dropbox/wip
createsymlink ~/cchou/wip/ ~/Dropbox/wip
rmsymlink ~/Dropbox/pm
createsymlink ~/cchou/pm ~/Dropbox/pm

## gdrive
rmhardlink ~/Google\ Drive/pm
createhardlink ~/cchou/pm ~/Google\ Drive/pm

## kanbox
rmhardlink ~/Kupan.localized/french
createhardlink ~/cchou/french ~/Kupan.localized/french
rmhardlink ~/Kupan.localized/music
createhardlink ~/cchou/music ~/Kupan.localized/music
rmhardlink ~/Kupan.localized/reading
createhardlink ~/cchou/reading ~/Kupan.localized/reading