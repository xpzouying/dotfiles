# Dotfiles #


Dotfiles for zouying.


## TODO ##

- Update airline to lightline
    > [https://github.com/itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)


## Software ##
- Nerd tree font: (vim-devicons)[https://github.com/ryanoasis/vim-devicons]
- fzf: (fzf)[https://github.com/junegunn/fzf]


## Questions ##

### vscode can't full screen ###

`brew install reattach-to-user-namespace`

And then add to your ~/.tmux.conf:

`set-option -g default-command "reattach-to-user-namespace -l zsh"`


