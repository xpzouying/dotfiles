# tmux config #


```bash
# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# reload tmux environment
tmux source ~/.tmux.conf
```

## install

Installing plugins

- Add new plugin to ~/.tmux.conf with set -g @plugin '...'
- Press prefix + I (capital I, as in Install) to fetch the plugin.

## uninstall

Uninstalling plugins

- Remove (or comment out) plugin from the list.
- Press prefix + alt + u (lowercase u as in uninstall) to remove the plugin.

All the plugins are installed to ~/.tmux/plugins/ so alternatively you can find plugin directory there and remove it.


