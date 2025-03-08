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

# 创建 oh-my-zsh 插件目录
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
PLUGINS_DIR="$ZSH_CUSTOM/plugins"
mkdir -p "$PLUGINS_DIR"

# 安装 zsh-autosuggestions
if [ ! -d "$PLUGINS_DIR/zsh-autosuggestions" ]; then
    print_message "安装 zsh-autosuggestions 插件..."
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$PLUGINS_DIR/zsh-autosuggestions"
else
    print_message "zsh-autosuggestions 插件已安装"
fi

# 安装 zsh-syntax-highlighting
if [ ! -d "$PLUGINS_DIR/zsh-syntax-highlighting" ]; then
    print_message "安装 zsh-syntax-highlighting 插件..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGINS_DIR/zsh-syntax-highlighting"
else
    print_message "zsh-syntax-highlighting 插件已安装"
fi

# 安装 fast-syntax-highlighting
if [ ! -d "$PLUGINS_DIR/fast-syntax-highlighting" ]; then
    print_message "安装 fast-syntax-highlighting 插件..."
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$PLUGINS_DIR/fast-syntax-highlighting"
else
    print_message "fast-syntax-highlighting 插件已安装"
fi

# 安装 zsh-autocomplete
if [ ! -d "$PLUGINS_DIR/zsh-autocomplete" ]; then
    print_message "安装 zsh-autocomplete 插件..."
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git "$PLUGINS_DIR/zsh-autocomplete"
else
    print_message "zsh-autocomplete 插件已安装"
fi

print_message "所有 zsh 插件安装完成！"
