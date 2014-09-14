#!/bin/bash
############################
# install.sh
# Taken from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/.
############################

dir=~/dotfiles
if [ -n "$1" ]; then
    dir=~/dotfiles/profiles/$1
fi
olddir=~/dotfiles-old
files="vimrc vim tmux.conf"

mkdir -p $olddir
cd $dir

for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    ln -s $dir/$file ~/.$file
done
