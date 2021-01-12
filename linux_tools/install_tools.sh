#!/bin/bash

echo "https://github.com/sharkdp/bat"

apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
