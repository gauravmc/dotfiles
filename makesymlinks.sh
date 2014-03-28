#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
files=".bashrc .vimrc .bash_profile .zshrc .gitconfig .bundle/config"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

echo "Changing to the $dir directory"
cd $dir

for file in $files; do
  if test -f ~/$file && test -f $dir/$file; then
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
  fi

  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/$file
done
