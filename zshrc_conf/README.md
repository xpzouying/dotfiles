#oh-my-zsh config

1. Install Theme `pure`: https://github.com/sindresorhus/pure
2. install colors supports
    brew install coreutils
3. install `z`:
    brew install z
	OR
    ```bash
	wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh
    ```
4. install zplus
	`curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh`


## Plugins

插件安装汇总：

- 直接安装这个即可：https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df


- `https://github.com/zsh-users/zsh-autosuggestions`

OR

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- `brew install zsh-syntax-highlighting`

OR

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## 参考资料

- [Configuration of a beautiful (efficient) terminal and prompt on OSX in 7minutes](https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961)
