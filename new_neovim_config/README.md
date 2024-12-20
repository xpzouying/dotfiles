# README

## Plugin

### OS Plugin

```bash

# macOS
brew install ripgrep
brew install fd

# Ubuntu
sudo apt install fd-find

```

### Vim Plugs


1. vim-plug
1. vim-go
1. [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
1. (Optional) - [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - better UI
1. [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)


** After vim-plug **


```bash
:Clap install-binary
```


### LazyVim

```
mkdir -p ~/.config/nvim/lua/plugins
touch ~/.config/nvim/lua/plugins/colorscheme.lua

vim ~/.config/nvim/lua/plugins/colorscheme.lua
```

colorscheme.lua

```
return {
  -- Add catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "latte", -- 设置为浅色主题
      background = {
        light = "latte",
      },
      transparent_background = false,
      integrations = {
        telescope = true,
        mason = true,
        mini = true,
        which_key = true,
        noice = true,
      },
    },
  },

  -- Change Default Colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
```

#### 安装 Telescope 插件

```bash
nvim ~/.config/nvim/lua/plugins/telescope.lua
```

内容如下，

```
-- ~/.config/nvim/lua/plugins/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
}
```



## Ref:

- [Golang开发环境 - 使用neovim 0.5](https://amikai.github.io/2021/08/16/go_neovim_env_0.5/)

- [How to set up neovim 0.5](https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887)


- dotfiles examples

  - [AGou-ops dotfiles](https://github.com/AGou-ops/dotfiles) - lua config配置参考。

  - [glepnir/nvim](https://github.com/glepnir/nvim) - Fastest startup time in 20-35ms(depends ssd) with 42 plugins.
