
# brew-bottles
set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles


# golang
set -x GOPATH $HOME/src/GOPATH
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin/

# python3 default
alias python python3
alias pip pip3

#Add anaconda & anaconda3
set -x PATH $PATH $HOME/anaconda/bin/

