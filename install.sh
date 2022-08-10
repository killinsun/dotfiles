#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi


if [ ! -e ~/.vim ]; then
	mkdir ~/.vim
fi

if [ ! -e ~/bin ]; then
	mkdir ~/bin
fi

unlink ~/.gitconfig
unlink ~/.vimrc
unlink ~/.vim/colors;
unlink ~/.vim/ftdetect;
unlink ~/.vim/indent;
unlink ~/.tmux.conf
unlink ~/bin/tmux-alias.sh

ln -sf $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/.vim/colors  ~/.vim/colors
ln -sf $SCRIPT_DIR/.vim/ftdetect ~/.vim/ftdetect
ln -sf $SCRIPT_DIR/.vim/indent ~/.vim/indent
ln -sf $SCRIPT_DIR/.tmux.conf ~/.tmux.conf
ln -sf $SCRIPT_DIR/tmux-alias.sh ~/bin/tmux-alias.sh


if [ $OS == 'Mac' ]; then
	unlink ~/.zshrc
	ln -sf $SCRIPT_DIR/.zshrc ~/.zshrc
fi

if [ $OS == 'Linux' ]; then
	unlink ~/.bashrc
	unlink ~/.bash_profile
	ln -sf $SCRIPT_DIR/.bashrc ~/.bashrc
	ln -sf $SCRIPT_DIR/.bash_profile ~/.bash_profile
fi
