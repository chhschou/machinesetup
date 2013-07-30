#!/usr/bin/env bash
### osx machine settings, Chris Chou, changhsinchou@gmail.com

## prevents DS_STORE file on smb/cifs/afp/nfs/webdav, see http://support.apple.com/kb/ht1629
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
