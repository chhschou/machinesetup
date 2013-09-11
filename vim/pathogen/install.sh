#!/usr/bin/env bash

## install to user dir
mkdir -p ~/.vim/autoload ~/.vim/bundle

## download pathogen.vim to dir
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
