#!/bin/bash
####################
# make.sh
# This script creates symlinks from the home directory.
####################


########## Variables

# dir_files=~/dotfiles    # dotfiles directory
dotfiles_path=$(pwd)
files="vimrc vimrc.bundles gitconfig"   # list of files in $dotfiles_path

########## Script
echo "Making files from $dotfiles_path to $HOME"

for file in $files; do
    echo "Creating link to $file."
    ln -sf $dotfiles_path/$file ~/.$file
done
