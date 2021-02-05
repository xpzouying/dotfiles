#!/bin/bash



echo "install brew for macos"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> $HOME/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)



echo "setting pip"
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

