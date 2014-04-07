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



## Copy
rmsymlink ~/Copy/dev
createsymlink ~/cchou/dev/ ~/Copy/dev

## DropBox
rmsymlink ~/Dropbox/wip
createsymlink ~/cchou/wip/ ~/Dropbox/wip
rmsymlink ~/Dropbox/pm
createsymlink ~/cchou/pm ~/Dropbox/pm

## gdrive

## box sync
rmsymlink ~/Box\ Sync/cdcorp
createsymlink ~/cchou/cdcorp ~/Box\ Sync/cdcorp
rmsymlink ~/Box\ Sync/personal
createsymlink ~/cchou/personal ~/Box\ Sync/personal
rmsymlink ~/Box\ Sync/pm
createsymlink ~/cchou/pm ~/Box\ Sync/pm


## kanbox
rmhardlink ~/Kupan.localized/french
createhardlink ~/cchou/french ~/Kupan.localized/french
rmhardlink ~/Kupan.localized/music
createhardlink ~/cchou/music ~/Kupan.localized/music
rmhardlink ~/Kupan.localized/reading
createhardlink ~/cchou/reading ~/Kupan.localized/reading