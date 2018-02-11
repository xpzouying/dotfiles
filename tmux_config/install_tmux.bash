#!/bin/bash

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
