#!/bin/sh
git submodule init
git submodule update

if [ -e ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc.orig
fi
ln -s ~/.vim/.vimrc ~/.vimrc

if [ -e ~/.tmux.conf ]
then
  mv ~/.tmux.conf ~/.tmux.conf.orig
fi
ln -s ~/.vim/.tmux.conf ~/.tmux.conf

if [[ "`uname -a | tr 'A-Z' 'a-z'`" == *linux* ]]
then
  sed -i -e '/MacOSX/s/^/#/' ~/.vim/.tmux.conf
fi
