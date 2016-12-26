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
rmsymlink ~/Copy/cdcorp
createsymlink /Users/Shared/admins/cdcorp ~/Copy/CDCorp
rmsymlink ~/Copy/Serendipia
createsymlink /Users/Shared/admins/serendipia ~/Copy/SerenDipia

## DropBox
rmsymlink ~/Dropbox/cdcorp
createsymlink /Users/Shared/admins/cdcorp ~/Dropbox/CDCorp
rmsymlink ~/Dropbox/Serendipia
createsymlink /Users/Shared/admins/serendipia ~/Dropbox/SerenDipia



## kanbox
rmsymlink ~/Kupan.localized/french
createsymlink ~/cchou/french ~/Kupan.localized/french
rmsymlink ~/Kupan.localized/music
createsymlink ~/cchou/music ~/Kupan.localized/music
rmsymlink ~/Kupan.localized/reading
createsymlink ~/cchou/reading ~/Kupan.localized/reading