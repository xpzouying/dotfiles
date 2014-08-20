#!/bin/bash
####################
# make.sh
# This script creates symlinks from the home directory.
####################


########## Variables

dir_files=~/dotfiles    # dotfiles directory
files="vimrc vimrc.bundles gitconfig"   # list of files in $dir_files

########## Script
echo "Making files from $dir_files to $HOME"

for file in $files; do
    echo "Creating link to $file."
    ln -sf $dir_files/$file	~/.$file
done
