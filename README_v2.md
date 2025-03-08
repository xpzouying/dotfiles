# 新的配置

## 1. 目录结构

```
dotfiles/
│
├── brew/
│   ├── Brewfile                 # 通用的包（适用于所有系统）
│   ├── Brewfile.macos           # macOS 特定的包
│   ├── Brewfile.linux           # Linux 特定的包
│   └── install.sh               # Homebrew 安装脚本
│
├── zsh/
│   ├── .zshrc                   # 主配置文件
│   ├── .zshenv                  # 环境变量
│   ├── aliases.zsh              # 命令别名
│   └── functions.zsh            # 自定义函数
│
├── nvim/
│   ├── init.lua                 # LazyVim 基础配置
│   └── lua/                     # 模块化的配置目录
│
├── git/
│   ├── .gitconfig               # 通用 Git 配置
│   └── .gitignore_global        # 全局忽略规则
│
├── fonts/                       # 你用的字体文件
│
├── scripts/
│   ├── setup.sh                 # 主安装脚本
│   ├── macos_setup.sh           # macOS 特定配置
│   └── linux_setup.sh           # Linux 特定配置
│
├── install.sh                   # 安装所有配置的主脚本
├── update.sh                    # 更新配置的脚本
└── README.md                    # 文档说明
```

## 2. 安装各种依赖

```bash
cd brew
bash ./install.sh
```

## 3. 安装 chezmoi

```bash
# 初始化
chezmoi init

# 管理
chezmoi managed
```
