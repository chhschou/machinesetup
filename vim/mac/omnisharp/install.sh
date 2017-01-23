#!/usr/bin/env bash

## assum already install pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/nosami/Omnisharp.git
cd Omnisharp
git submodule update --init
cd server
xbuild /p:Platform="Any CPU"

## install vim-dispatch to start 
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-dispatch.git
