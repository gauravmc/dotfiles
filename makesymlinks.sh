#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
folders=".bundle"
files=".vimrc .zshrc .ctags .gitconfig .bundle/config .agignore .gitignore_global .pryrc .gemrc"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

echo "Changing to the $dir directory"
cd $dir

for folder in $folders; do
  mkdir ~/$folder
done

for file in $files; do
  if test -f ~/$file && test -f $dir/$file; then
    echo "Moving existing $file from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
  fi

  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/$file
done
