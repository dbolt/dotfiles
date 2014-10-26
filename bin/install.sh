#!/bin/bash
DOTFILES=$(pwd)
link() {
    echo "Linking $DOTFILES/$1 -> $HOME/$1"
    rm -rf $HOME/$1;
    ln -s $DOTFILES/$1 $HOME/$1
}

link .gitconfig
link .tmux.conf
link .vimrc
link .zshrc
