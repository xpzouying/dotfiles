#!/bin/bash



echo "install brew for macos"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> $HOME/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)

echo "config brew of macos for tsinghua repo"

cd "$(brew --repo)"
git remote set-url origin https://mirrors.ustc.edu.cn/brew.git

cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git




echo "setting pip"
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple


echo "plugins..."
brew install fzf

echo "bat..."
brew install bat

echo "rg..."
brew install rg

