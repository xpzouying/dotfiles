# dotfiles

## 介绍

该repo是邹颖个人的dotfiles。其中包含，

1. git配置

2. neovim配置

3. tmux配置

4. zsh配置

5. utils：其他常用的小工具


## 详细介绍


### git配置

配置目录：`./git_config`

- 安装

进入目录后，运行命令

```bash
cd ./git_config

bash ./install.sh
```

### neovim配置

配置目录：`./neovim_config`

- 安装

进入目录后，运行命令配置neovim的配置

```bash
cd ./neovim_config

# 会安装部分工具：vim-plugin
bash ./config_neovim.sh
```

- 安装nvim插件

```bash
nvim

:PlugInstall
```

### tmux配置

配置目录：`./tmux_config`

- 安装tmux

```bash
brew install tmux
```

- 配置tmux

```bash

# 其中会安装tpm（tmux plugin manager），用于管理插件
bash ./install_tmux.bash
```


### zsh配置

配置目录：`./zshrc_conf`


- 确定系统已经安装zsh

```bash
# 安装zsh
brew install zsh
```

- 安装oh-my-zsh配置

```bash
# 其中会安装oh-my-zsh和zplus
bash ./install_zsh.sh
```

- zsh环境变量设置

  - $HOME/.zy_alias_rc：设置较为通用的环境变量
  
  - $HOME/.local_rc：设置当前机器的环境变量，该文件不上传到repo管理，只对当前机器有效。比如当前当前服务器的自定义PATH路径。





## 一些好用的工具


## Software ##
- Nerd tree font: [vim-devicons](https://github.com/ryanoasis/vim-devicons)
- fzf: [fzf](https://github.com/junegunn/fzf) `brew install fzf`
- rg: [rg](https://github.com/BurntSushi/ripgrep) - `brew install ripgrep`
- ag: `brew install the_silver_searcher`
- [fd](https://github.com/sharkdp/fd)：better find tools. `brew install fd`

## 其他设置

### pip settings ###

cat ~/.pip/pip.conf

```bash
[global]
index-url = https://pypi.douban.com/simple/
trusted-host = pypi.douban.com
```

### 删除已经合入到主干分支的其他分支

```bash
git branch -d $(git branch --merged=master | grep -v master)

git fetch --prune
```

### macos的一些命令

Ref: [如何给码农👨‍💻‍的Mac开光](https://wyydsb.xin/other/terminal.html)


```bash
# install Command Line Tools
$ xcode-select --install

# install software manager homebrew(maybe very slowly - you can use cellular)
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew的国内源
$ cd "$(brew --repo)"
$ git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
$ cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
$ git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git


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
```


### Better Tools

Better for:

- ls: [exa](https://github.com/ogham/exa)
- curl: [httpie](https://httpie.org/)
- curl: [bat](https://github.com/sharkdp/bat)
- grep: [rg/ripgrep](https://github.com/BurntSushi/ripgrep)
- find: [fd](https://github.com/sharkdp/fd)
- diff: [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
- man: [tldr](https://github.com/tldr-pages/tldr)
- [jq](https://github.com/stedolan/jq)
- [termshark](https://github.com/gcla/termshark) - A terminal UI for tshark, inspired by Wireshark
- [mark-directory](https://github.com/kodango/mark-directory) - Provides a quick way to change directory from the command line.

