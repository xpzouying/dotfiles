#!/bin/bash

set -e

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印带颜色的消息
print_message() {
    echo -e "${BLUE}==>${NC} ${GREEN}$1${NC}"
}

# 检查是否安装了 Homebrew
if ! command -v brew &> /dev/null; then
    print_message "安装 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    print_message "Homebrew 已安装，更新中..."
    brew update
fi

# 安装 Brewfile 中的依赖
print_message "安装 Brewfile 中的依赖..."
brew bundle --file=brew/Brewfile

# 安装 oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_message "安装 oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    print_message "oh-my-zsh 已安装"
fi

# 安装 zsh 插件
print_message "安装 zsh 插件..."
chmod +x zshrc_conf/install_zsh_plugins.sh
./zshrc_conf/install_zsh_plugins.sh

# 安装 chezmoi（如果尚未安装）
if ! command -v chezmoi &> /dev/null; then
    print_message "安装 chezmoi..."
    brew install chezmoi
else
    print_message "chezmoi 已安装"
fi

# 使用 chezmoi 应用配置
print_message "应用 dotfiles 配置..."
chezmoi init --apply

# 创建本地配置文件（如果不存在）
if [ ! -f "$HOME/.local_rc" ]; then
    print_message "创建本地配置文件 ~/.local_rc"
    touch "$HOME/.local_rc"
fi

# 创建 zybin 目录（如果不存在）
if [ ! -d "$HOME/zybin" ]; then
    print_message "创建 ~/zybin 目录"
    mkdir -p "$HOME/zybin"
fi

print_message "安装完成！请重新启动您的终端或运行 'source ~/.zshrc' 以应用更改。"
