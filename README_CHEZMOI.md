# 使用 Chezmoi 管理 ZSH 配置

本文档说明如何使用 [chezmoi](https://www.chezmoi.io/) 管理 ZSH 配置文件。

## 配置文件

- `~/.zshrc`: ZSH 主配置文件
- `~/.zy_alias_rc`: 通用别名和函数
- `~/.local_rc`: 本地特定配置（不由 chezmoi 管理）

## 安装步骤

1. 安装 Homebrew（如果尚未安装）:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. 安装必要的工具:

   ```bash
   brew bundle --file=brew/Brewfile
   ```

3. 安装 oh-my-zsh:

   ```bash
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

4. 安装 ZSH 插件:

   ```bash
   ./zshrc_conf/install_zsh_plugins.sh
   ```

5. 使用 chezmoi 应用配置:
   ```bash
   chezmoi init
   chezmoi apply
   ```

## 更新配置

当您对配置进行更改后，可以使用以下命令应用更改:

```bash
chezmoi apply
```

## 添加新文件到 chezmoi

```bash
chezmoi add ~/.some_config_file
```

## 本地特定配置

本地特定的配置可以添加到 `~/.local_rc` 文件中，该文件不会被 chezmoi 管理。
