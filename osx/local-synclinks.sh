#!/usr/bin/env bash

##
# Configs to map various files and folders to corresponding place in system 
#
# ln syntax is ln -s src dest, must specify dest link name
##

function rmsymlink {
	symlink=$1;
	
	if [ -f "$symlink" ];
	then
		rm "$symlink";
	fi
}

function createsymlink {
	linksrc=$1;
	linkdest=$2;
	
	# force, don't follow link (in case its a dir)
	ln -s -h -f "$linksrc" "$linkdest";
}

function rmhardlink {
	hardlink=$1;
	
	if [ -f "$hardlink" ] || [ -d "$hardlink" ];
	then
		./hlink -u "$hardlink";
	fi
}

function createhardlink {
	linksrc=$1;
	linkdest=$2;

	./hlink "$linksrc" "$linkdest";
}


## setup profile and vimrc
rmsymlink ~/.profile
createsymlink ~/.profile ~/cchou/tools/machinesetup/osx/.profile 
rmsymlink ~/.vimrc
createsymlink ~/.vimrc ~/cchou/tools/machinesetup/vim/.vimrc