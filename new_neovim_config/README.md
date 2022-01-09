# README

## Plugin

### OS Plugin

```bash

brew install ripgrep

```

### Vim Plugs


1. vim-plug
1. vim-go
1. [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
1. (Optional) - [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - better UI
1. [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)


** After vim-plug **


```bash

# :TSInstall go


:CocInstall coc-go

:CocConfig

// {
//   "go.goplsOptions": {
//     "completeUnimported": true
//   }
// }
```


## Ref:

- [Golang开发环境 - 使用neovim 0.5](https://amikai.github.io/2021/08/16/go_neovim_env_0.5/)

- [How to set up neovim 0.5](https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887)
