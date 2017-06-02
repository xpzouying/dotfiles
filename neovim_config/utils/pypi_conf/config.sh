#/bin/bash

if [ ! -d $HOME/.pip ]; then
    echo "make $HOME/.pip"
    mkdir $HOME/.pip
fi


if [ ! -f $HOME/.pip/pip.conf ]; then
    echo "pip.conf not exists. link it."
    ln -s $(pwd)/pip.conf $HOME/.pip/pip.conf
fi
