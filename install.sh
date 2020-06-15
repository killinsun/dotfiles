#!/bin/bash


#brew install vim

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh

if [ ! -e ~/.vim/bundle ]; then
  mkdir ~/.vim/bundle
fi

sh ~/installer.sh ~/.vim/bundle

ln -sf /usr/local/src/dotfiles/.gitconfig ~/.gitconfig
ln -sf /usr/local/src/dotfiles/.hyper.js ~/.hyper.js
ln -sf /usr/local/src/dotfiles/.vimrc ~/.vimrc
ln -sf /usr/local/src/dotfiles/.vim/colors ~/.vim/colors
ln -sf /usr/local/src/dotfiles/.vim/ftdetect ~/.vim/ftdetect
ln -sf /usr/local/src/dotfiles/.vim/indent ~/.vim/indent
ln -sf /usr/local/src/dotfiles/.bash_profile ~/.bash_profile
ln -sf /usr/local/src/dotfiles/.bashrc ~/.bashrc


sh ~/.bash_profile
sh ~/.bashrc

