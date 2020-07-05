#/bin/bash


PLATFORM='unknown'
UNAME=`uname`

if [[ "$UNAME" == 'Linux' ]]; then
    PLATFORM='linux'
fi


echo "OS Platform is" $PLATFORM


# echo "Install zplug"
# if [[ "$PLATFORM" == 'linux' ]]; then
#     curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
# fi


# echo "install pure theme"
# npm install --global pure-prompt


echo "Link zsh"
ln -s "$(pwd)/zshrc" "$HOME/.zshrc"

ln -s "$(pwd)/zy_alias_rc" "$HOME/.zy_alias_rc"

touch "$HOME/.local_rc"


echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


echo "Install zplus"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
