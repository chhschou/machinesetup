#!/bin/bash

# install base system
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:apt-fast/stable
sudo apt-get update && sudo apt-get install -y apt-fast
# add mirrors to apt-fast config (very important for speedup)
#sed -i "s/#MIRRORS=( 'none' )/MIRRORS=( 'http:\/\/mirrors.ustc.edu.cn\/ubuntu\/,http:\/\/mirror.lzu.edu.cn\/ubuntu\/,http:\/\/ubuntu.dormforce.net\/ubuntu\/' )/" /etc/apt-fast.conf

# git latest stable
sudo apt-add-repository -y ppa:git-core/ppa
sudo apt-fast update && sudo apt-fast install -y git

# vim, ctags
sudo apt-fast install -y vim ctags 

# vim pathogen (add customization to vim)
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
    
# Solarized for vim
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git

# virtualbox, need to disable deb-src linein sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-fast update && sudo apt-fast install -y linux-headers-generic virtualbox-4.2

# medibuntu
sudo -E wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update
sudo apt-fast update && sudo apt-fast install app-install-data-medibuntu apport-hooks-medibuntu
sudo apt-fast install ubuntu-restricted-extras vlc # may only need this for most things entertainment wise


# pinyin
sudo add-apt-repository ppa:fcitx-team/nightly
sudo apt-fast update
sudo apt-fast install fcitx fcitx-googlepinyin fcitx-module-cloudpinyin

# pdf print
sudo apt-fast install -y cups-pdf

# Cisco VPn
sudo apt-fast install -y network-manager-vpnc

# chromium 
sudo apt-fast install -y chromium-browser

# evolution, repo for quantal upgrade as default version buggy
sudo add-apt-repository ppa:support-bec/evolution
sudo apt-get update
sudo apt-fast install -y evolution evolution-ews evolution-plugins-experimental mswatch muttprint

# google talk
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# libreoffice
sudo add-apt-repository ppa:libreoffice/ppa

# wps for linux (ms office clone)
http://community.wps.cn/download/
cd /opt/kingsoft/wps-office/office6/2052 # eng menu tweak
sudo rm qt.qm wps.qm wpp.qm et.qm

# nautilus extra actions
sudo add-apt-repository ppa:nae-team/ppa
sudo apt-fast update
sudo apt-fast install nautilus-open-terminal 

# dropbox, may need to get the official ubuntu client
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
sudo apt-fast update && sudo apt-fast install nautilus-dropbox

# Calibre
sudo python -c "import sys; py3 = sys.version_info[0] > 2; u = __import__('urllib.request' if py3 else 'urllib', fromlist=1); exec(u.urlopen('http://status.calibre-ebook.com/linux_installer').read()); main(install_dir='/opt')"

# rabbitvcs
sudo add-apt-repository ppa:rabbitvcs/ppa
sudo apt-fast update
sudo apt-fast install rabbitvcs-nautilus3

# handbrake
sudo add-apt-repository ppa:stebbins/handbrake-snapshots
sudo apt-fast update
sudo apt-fast install handbrake-gtk

# gwibber weibo
sudo apt-add-repository ppa:gwibber-team/ppa
sudo apt-fast update
sudo apt-fast install gwibber account-plugin-sina gwibber-service-sina

# monodevelop (unstable)
sudo apt-add-repository ppa:keks9n/monodevelop-latest 
sudo apt-fast update && sudo apt-fast install monodevelop-latest 

# java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-fast update
sudo echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-fast install oracle-java7-installer
java -version # check version 
sudo update-java-alternatives -s java-7-oracle # do this if 1.7 of java not selected
sudo apt-fast install oracle-java7-set-default # auto default
# Remove installation: sudo apt-get remove oracle-java7-installer 

# java dev tools
sudo apt-fast install maven groovy ant grails


# nginx
sudo add-apt-repository ppa:nginx/stable
sudo apt-fast update && sudo apt-fast install -y nginx

# webex (need oracle linux)
sudo apt-fast -y install ia32-libs
# may need to remove .webex folder under home folder to force install

# pulseaudio (cork music when receiving voip calls
sudo -H gedit /etc/pulse/default.pa
# uncomment the line load-module module-role-cork

# geany
sudo add-apt-repository ppa:geany-dev/ppa
sudo apt-fast update && sudo apt-fast install -y geany

# scribes
sudo add-apt-repository ppa:mystilleef/scribes-daily
sudo apt-fast update && sudo apt-fast install -y scribes

# Unison (Synctoy)
sudo apt-fast -y install unison-gtk

# node js
sudo apt-get update
sudo apt-get install g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

# install mysql
sudo apt-fast install -y mysql-server mysqltuner # produce tuning reports

# install postgresql
sudo apt-fast install postgresql
sudo apt-fast install postgresql-client # postgresql client
sudo apt-fast install pgadmin3 # ubuntu desktop

# python for scientific (before they finish porting pythonxy)
sudo apt-fast install -y python-pip python-dev build-essential python-qt4 python-numpy python-scipy python-matplotlib spyder

# wxwidget with python
sudo apt-fast install -y python-wxgtk2.8 python-wxtools wx2.8-doc wx2.8-examples wx2.8-headers wx2.8-i18n

# rubygems mirror (access default rubygems.org is too slow in China)
http://tokyo-m.rubygems.org

# vmware-tools
sudo apt-fast install open-vm-tools

# gnome online accounts (manage kerebros auth and integration with evolution)
env XDG_CURRENT_DESKTOP=GNOME gnome-control-center online-accounts


# Fonts (for desktop)
# run InstallFonts.sh from Fonts folder 

# Register dns
sudo addns -U -m # needs ad to allow non-secure dynamic updates (write perm to "Domain Computers")
# net ads dns register -P (Samba only) 
