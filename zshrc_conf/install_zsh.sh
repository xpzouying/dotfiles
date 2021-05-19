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
mv $HOME/.zshrc /tmp/zshrc_bak
ln -s "$(pwd)/zshrc" "$HOME/.zshrc"

ln -s "$(pwd)/zy_alias_rc" "$HOME/.zy_alias_rc"
ln -s "$(pwd)/markrc" "$HOME/.markrc"

touch "$HOME/.local_rc"


echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


mkdir $HOME/zybin


echo "Install zplus"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# powerlevel10k
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# --- disalbe conda auto activating
# Ref: https://stackoverflow.com/questions/54429210/how-do-i-prevent-conda-from-activating-the-base-environment-by-default
conda config --set auto_activate_base false
