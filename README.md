# Dotfiles #


Dotfiles for zouying.

## Settings ##

### pip settings ###

cat ~/.pip/pip.conf

    > [global]
    > index-url = https://pypi.douban.com/simple/
    > trusted-host = pypi.douban.com

### Init OS 👨‍💻

Ref: [如何给码农👨‍💻‍的Mac开光](https://wyydsb.xin/other/terminal.html)

```bash
# install Command Line Tools
$ xcode-select --install

# install software manager homebrew(maybe very slowly - you can use cellular)
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# change mirror to tuna
$ cd "$(brew --repo)"
$ git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
$ cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
$ git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

# install zsh & change bash -> zsh
$ brew install zsh git autojump
$ chsh -s /bin/zsh

# install oh-my-zsh
$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# syntax highlighting
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
$ echo "source \$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# zsh-autosuggestions
$ git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# configure system set in ~/.zshrc
$ vim ~/.zshrc

# https://github.com/robbyrussell/oh-my-zsh/wiki/themes
# https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes
ZSH_THEME="avit"  # zsh theme like 'ys' refer web👆
plugins=(
    git
    docker
    zsh-autosuggestion  # autosuggestion
)

# alias
alias dkst="docker stats"
alias dkpsa="docker ps -a"
alias dkimgs="docker images"
alias dkcpup="docker-compose up -d"
alias dkcpdown="docker-compose down"
alias dkcpstart="docker-compose start"
alias dkcpstop="docker-compose stop"
alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1086"  # terminal proxy
alias unsetproxy="unset ALL_PROXY"

export HOMEBREW_NO_AUTO_UPDATE=true                        # no update when use brew

source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# end of edit ~/.zshrc
$ source ~/.zshrc
```



## TODO ##

- Update airline to lightline

    > [https://github.com/itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)


## Software ##
- Nerd tree font: [vim-devicons](https://github.com/ryanoasis/vim-devicons)
- fzf: [fzf](https://github.com/junegunn/fzf) `brew install fzf`
- ag: `brew install the_silver_searcher`
- [fd](https://github.com/sharkdp/fd)：better find tools. `brew install fd`

## Questions ##

### vscode can't full screen ###

`brew install reattach-to-user-namespace`

And then add to your ~/.tmux.conf:

`set-option -g default-command "reattach-to-user-namespace -l zsh"`


### cleanup git branch

```bash
git branch -d $(git branch --merged=master | grep -v master)

git fetch --prune

```

