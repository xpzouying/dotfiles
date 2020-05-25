

1. Plugins:
## vim-plug:
    https://github.com/junegunn/vim-plug

    installtion:
        curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



## Start nvim and run:

	- :PlugInstall
    - :UpdateRemotePlugins
	- :CocInfo
	- :CocConfig

		```json
			{
				"languageserver": {
					"golang": {
						"command": "gopls",
							"rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/"],
							"filetypes": ["go"]
					}
				}
			}
		```


# Common errors

## E303: Unable to open swap file for "{filename}", recovery impossible
    > `set directory?`
    > mkdir the path which how by `set directory?`
    > make sure the swap directory has the right permission.


##### Others

1. Ref urls:
	- [Config vim as a go IDE](https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/)


2. Quick look plugins
    brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo

3. Colors not working in terminal. Add these in `~/.bashrc` or `~/.zshrc`
```bash
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
```

4. DNS for github
**Github**
**beijing port**
151.101.72.133  assets-cdn.github.com
151.101.72.249  github.global.ssl.fastly.net
**hong kong**
151.101.76.133  assets-cdn.github.com
151.101.76.249  github.global.ssl.fastly.net
