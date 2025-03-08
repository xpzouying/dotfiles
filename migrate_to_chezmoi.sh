#!/bin/bash

set -e

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# 打印带颜色的消息
print_message() {
    echo -e "${BLUE}==>${NC} ${GREEN}$1${NC}"
}

print_warning() {
    echo -e "${YELLOW}警告:${NC} $1"
}

# 检查是否安装了 chezmoi
if ! command -v chezmoi &> /dev/null; then
    print_message "安装 chezmoi..."
    brew install chezmoi
else
    print_message "chezmoi 已安装，版本: $(chezmoi --version)"
fi

# 检查 chezmoi 是否已初始化
if [ ! -d "$HOME/.local/share/chezmoi" ]; then
    print_message "初始化 chezmoi..."
    chezmoi init
else
    print_message "chezmoi 已初始化"
fi

# 迁移 ZSH 配置
print_message "迁移 ZSH 配置..."

# 检查 .zshrc 是否是符号链接
if [ -L "$HOME/.zshrc" ]; then
    ZSHRC_TARGET=$(readlink "$HOME/.zshrc")
    print_warning "发现 .zshrc 是符号链接，指向 $ZSHRC_TARGET"
    print_message "将原始文件添加到 chezmoi..."
    chezmoi add "$ZSHRC_TARGET"
else
    print_message "添加 .zshrc 到 chezmoi..."
    chezmoi add "$HOME/.zshrc"
fi

# 检查 .zy_alias_rc 是否是符号链接
if [ -L "$HOME/.zy_alias_rc" ]; then
    ZY_ALIAS_TARGET=$(readlink "$HOME/.zy_alias_rc")
    print_warning "发现 .zy_alias_rc 是符号链接，指向 $ZY_ALIAS_TARGET"
    print_message "将原始文件添加到 chezmoi..."
    chezmoi add "$ZY_ALIAS_TARGET"
else
    print_message "添加 .zy_alias_rc 到 chezmoi..."
    chezmoi add "$HOME/.zy_alias_rc"
fi

# 显示 chezmoi 状态
print_message "当前 chezmoi 状态:"
chezmoi status

# 提示用户下一步操作
echo ""
echo -e "${GREEN}迁移第一阶段完成!${NC}"
echo ""
echo "下一步操作:"
echo "1. 查看 chezmoi 将进行的更改: ${BLUE}chezmoi diff${NC}"
echo "2. 应用更改: ${BLUE}chezmoi apply${NC}"
echo "3. 编辑 chezmoi 管理的文件: ${BLUE}chezmoi edit ~/.zshrc${NC}"
echo ""
echo "要迁移更多配置文件，请运行: ${BLUE}chezmoi add ~/.配置文件${NC}"
echo ""
echo "要将 chezmoi 仓库推送到 GitHub:"
echo "1. ${BLUE}chezmoi cd${NC}"
echo "2. ${BLUE}git init${NC}"
echo "3. ${BLUE}git add .${NC}"
echo "4. ${BLUE}git commit -m \"Initial chezmoi commit\"${NC}"
echo "5. ${BLUE}git remote add origin https://github.com/xpzouying/chezmoi-dotfiles.git${NC}"
echo "6. ${BLUE}git push -u origin main${NC}"
