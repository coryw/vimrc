#!/bin/bash

# This scirpt backs up the current .vimrc, downloads Vundle, copies the new .vimrc,
# and installs the plugins using :PluginInstall.
# Created 2018-09-06

# Backup existing .vimrc if necessary
if [ -f ~/.vimrc ]
then
    echo "-- Backing up existing .vimrc --"
    mv -v ~/.vimrc ~/.vimrc.bak
fi 

# Check to see if Vundle plugin manager is installed
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
    echo "-- Vundle plugin manager not found; installing --"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    # If download fails, abort
    if [ ! $? -eq 0 ]
    then
        echo "-- Vundle download failed; aborting --"
        exit 1
    fi
else
    echo "-- Vundle already installed; proceeding --"
fi

# Copy new .vimrc and install
echo "-- Copying new .vimrc --"
cp -v .vimrc ~/.vimrc &&
    echo "-- Copy successful. Press enter to open vim and install plugins. --" &&
    read -p "Press enter to proceed... " && 
    vim -c ":PluginInstall" &&
    echo "-- Success! --" ||
    echo "-- Installation failed. Sorry. "

