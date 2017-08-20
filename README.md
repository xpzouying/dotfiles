# Dotfiles #


Dotfiles for zouying.

## Settings ##

### pip settings ###

cat ~/.pip/pip.conf

    > [global]
    > index-url = https://pypi.douban.com/simple/
    > trusted-host = pypi.douban.com


## TODO ##

- Update airline to lightline
    > [https://github.com/itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)


## Software ##
- Nerd tree font: (vim-devicons)[https://github.com/ryanoasis/vim-devicons]
- fzf: (fzf)[https://github.com/junegunn/fzf]
- ag: `brew install the_silver_searcher`

## Questions ##

### vscode can't full screen ###

`brew install reattach-to-user-namespace`

And then add to your ~/.tmux.conf:

`set-option -g default-command "reattach-to-user-namespace -l zsh"`


