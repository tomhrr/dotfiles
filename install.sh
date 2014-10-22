#!/bin/bash
############################
# install.sh
# Taken from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/.
############################

dir=~/dotfiles
files="vimrc newsbeuter vim tmux.conf bash_profile bashrc git mcabberrc muttrc Xresources urlview"
olddir=~/dotfiles-old
if [ -n "$1" ]
then
    dir=~/dotfiles/profiles/$1
    files=~/dotfiles/profiles/$1/*
    olddir=~/dotfiles-old/profiles/$1
fi

mkdir -p ~/.mutt
mkdir -p $olddir
cd $dir

for file in $files; do
    file=`basename $file`
    if [ -e $file ]; then
        mv ~/.$file $olddir/
    fi
    ln -s $dir/$file ~/.$file
done
