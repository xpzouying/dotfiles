# Install Plugin For System #

## Config ##
- ssh-key with passphrase with `ssh-agent`
    > ```bash
	> if [ -z "$SSH_AUTH_SOCK" ] ; then
    > eval `ssh-agent -s`
  	> ssh-add
	> fi

## Packages ##
- Fonts:
    > - FiraCode:
    > brew tap caskroom/fonts
    > brew cask install font-fira-code
    > - Hack:
    > https://github.com/chrissimpkins/Hack

