#!/bin/bash
####################
# make.sh
# This script creates symlinks from the home directory.
####################


########## Variables

# dir_files=~/dotfiles    # dotfiles directory
dotfiles_path=$(pwd)
files="vimrc vimrc.bundles zshrc tmux.conf agignore"   # list of files in $dotfiles_path


# 1. Pre-install
sudo apt-get install -y vim git curl exuberant-ctags python-pip

##### pip install #####
sudo pip install pylint pep8


# 1. Add terminal color
echo "export TERM=xterm-256color" >> ~/.bashrc

# 1. Pre-install: Programming
sudo pip install jedi

# 1. Pre-install: Better features
sudo apt-get install -y silversearcher-ag

# 2. Configuration

# Colors {
    ## Setting Terminal to support 256 colors
    # Combine with *zshrc* config file.
    curl https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark > ~/.dircolors
# }

# zsh {
    # curl -L http://install.ohmyz.sh | sh
    # sudo chsh -s $(which zsh) $(whoami)

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo chsh -s $(which zsh)
# }

# vim plugins manager {
    # Use neobundle
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
# }

# Link config file.
echo "Making files from $dotfiles_path to $HOME"

for file in $files; do
    echo "Creating link to $file."
    ln -sf $dotfiles_path/$file ~/.$file
done

# Install font for vim
# sudo gnome-font-viewer tools/*.otf
# mkdir -p ~/.fonts/
# cp tools/fonts/*.otf ~/.fonts/


# Post-installation:
echo "Add airline fonts: git clone https://github.com/powerline/fonts.git"
echo "===== End ====="
