#!/bin/bash


brew install vim

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh

if [ ! -e ~/.vim/bundle ]; then
  mkdir ~/.vim/bundle
fi

sh ~/installer.sh ~/.vim/bundle

ln -sf ~/Documents/Projects/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/Documents/Projects/dotfiles/.hyper.js ~/.hyper.js
ln -sf ~/Documents/Projects/dotfiles/.vimrc ~/.vimrc
ln -sf ~/Documents/Projects/dotfiles/.vim/colors ~/.vim/colors
ln -sf ~/Documents/Projects/dotfiles/.vim/ftdetect ~/.vim/ftdetect
ln -sf ~/Documents/Projects/dotfiles/.vim/indent ~/.vim/indent
ln -sf ~/Documents/Projects/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/Documents/Projects/dotfiles/.bashrc ~/.bashrc


sh ~/.bash_profile
sh ~/.bashrc

