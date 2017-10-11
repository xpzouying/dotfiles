#!/bin/bash



PLATFORM='unknown'
UNAMESTR=$(uname)
if [[ "$UNAMESTR" == 'Linux' ]]; then
    PLATFORM='LINUX'
elif [[ "$UNAMESTR" == 'FreeBSD' ]]; then
    PLATFORM='FREEBSD'
elif [[ "$UNAMESTR" == 'Darwin' ]]; then
    PLATFORM='MACOSX'
fi


# use it
# if [[ "$PLATFORM" == 'MACOSX' ]]; then
#     brew install git-flow-avh
#     brew install git bash-completion  # for bash-completion
# fi


# This is Test
