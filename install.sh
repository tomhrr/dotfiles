#!/bin/bash
############################
# install.sh
# Taken from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/.
############################

dir=~/dotfiles
files="vimrc vim tmux.conf bash_profile bashrc gitconfig mcabberrc muttrc Xresources"
olddir=~/dotfiles-old
if [ -n "$1" ]
then
    dir=~/dotfiles/profiles/$1
    files=~/dotfiles/profiles/$1/*
    olddir=~/dotfiles-old/profiles/$1
fi

mkdir -p ~/.mutt
touch ~/.mutt/empty
chmod 755 ~/.mutt/empty
mkdir -p $olddir
cd $dir

for file in $files; do
    file=`basename $file`
    if [ -e $file ]; then
        mv ~/.$file $olddir/
    fi
    ln -s $dir/$file ~/.$file
done
