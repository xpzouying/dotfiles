# Dotfiles

这是我的个人 dotfiles 仓库，使用 [chezmoi](https://www.chezmoi.io/) 和 [Homebrew](https://brew.sh/) 进行管理。

## 包含内容

- ZSH 配置
- 常用别名和函数
- 终端提示符配置 (Starship)
- 常用工具安装 (通过 Homebrew)

## 快速安装

```bash
# 克隆仓库
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles

# 运行安装脚本
./install.sh
```

## 手动安装

1. 安装 Homebrew:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. 安装 chezmoi:

   ```bash
   brew install chezmoi
   ```

3. 初始化 chezmoi:

   ```bash
   chezmoi init --apply
   ```

4. 安装依赖:
   ```bash
   brew bundle --file=brew/Brewfile
   ```

## 更新配置

当您对配置进行更改后，可以使用以下命令应用更改：

```bash
chezmoi apply
```

## 添加新文件到管理

```bash
chezmoi add ~/.some_config_file
```

## 本地特定配置

本地特定的配置可以添加到 `~/.local_rc` 文件中，该文件不会被版本控制系统跟踪。

## 介绍

该 repo 是邹颖个人的 dotfiles。其中包含，

1. git 配置

2. neovim 配置

3. tmux 配置

4. zsh 配置

5. utils：其他常用的小工具

## 详细介绍

### 字体

- [Wenkai](https://github.com/lxgw/LxgwWenKai)
- [LXGW WenKai Screen / 霞鹜文楷屏幕阅读版](https://github.com/lxgw/LxgwWenKai-Screen)

### git 配置

配置目录：`./git_config`

- 安装

进入目录后，运行命令

```bash
cd ./git_config

bash ./install.sh

- [Popular Git Config Options](https://jvns.ca/blog/2024/02/16/popular-git-config-options)
```

### neovim 配置

配置目录：`./neovim_config`

- 安装

进入目录后，运行命令配置 neovim 的配置

```bash
cd ./neovim_config

# 会安装部分工具：vim-plugin
bash ./config_neovim.sh
```

- 安装 nvim 插件

```bash
nvim

:PlugInstall
```

### tmux 配置

配置目录：`./tmux_config`

- 安装 tmux

```bash
brew install tmux
```

- 配置 tmux

```bash

# 其中会安装tpm（tmux plugin manager），用于管理插件
bash ./install_tmux.bash
```

### zsh 配置

配置目录：`./zshrc_conf`

- 确定系统已经安装 zsh

```bash
# 安装zsh
brew install zsh
```

- 安装 oh-my-zsh 配置

```bash
# 其中会安装oh-my-zsh和zplus
bash ./install_zsh.sh
```

- zsh 环境变量设置

  - $HOME/.zy_alias_rc：设置较为通用的环境变量

  - $HOME/.local_rc：设置当前机器的环境变量，该文件不上传到 repo 管理，只对当前机器有效。比如当前当前服务器的自定义 PATH 路径。

## Fonts

```bash
# San Francisco Mono
brew install --cask font-sf-mono

# Microsoft Cascadia: Cascadia Code, Cascadia (Code|Mono) NF
brew install font-cascadia-code font-cascadia-mono-nf

# Intel One Mono
brew install --cask font-intel-one-mono

brew install --cask font-monaspace
```

## 一些好用的工具

## Software

- Nerd tree font: [vim-devicons](https://github.com/ryanoasis/vim-devicons)
- fzf: [fzf](https://github.com/junegunn/fzf) `brew install fzf`
- rg: [rg](https://github.com/BurntSushi/ripgrep) - `brew install ripgrep`
- ag: `brew install the_silver_searcher`
- [fd](https://github.com/sharkdp/fd)：better find tools. `brew install fd`
- [Log file navigator](https://github.com/tstack/lnav)

## 其他设置

### pip settings

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

### macos 的一些命令

Ref: [如何给码农 👨‍💻‍ 的 Mac 开光](https://wyydsb.xin/other/terminal.html)

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
- better git diff: [git-delta](https://github.com/dandavison/delta)

- local https 证书 - [mkcert](https://github.com/FiloSottile/mkcert)
