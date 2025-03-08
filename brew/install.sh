#!/bin/bash

# 安装通用的包
brew bundle

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing macOS packages..."
    brew bundle --file="Brewfile.macos"
else
    echo "Installing Linux packages..."
    brew bundle --file="Brewfile.linux"
fi
