#!/bin/bash
##################################
# make.sh
##################################

dir=~/Dev/dotfiles
olddir=~/dotfiles_old
files="ackrc vimrc gitconfig gvimrc bash_profile gitignore_global eslintrc.js"

echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory"
  ln -fs $dir/$file ~/.$file
done
