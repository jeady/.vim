#!/bin/sh
git submodule init
git submodule update

if [ -e ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc.orig
fi
ln -s `pwd`/.vimrc ~/.vimrc

if [ -e ~/.tmux.conf ]
then
  mv ~/.tmux.conf ~/.tmux.conf.orig
fi
ln -s ~/.vim/.tmux.conf ~/.tmux.conf

if [[ "`uname -a | tr 'A-Z' 'a-z'`" == *linux* ]]
then
  sed -i -e '/MacOSX/s/^/#/' .tmux.conf
fi

escaped_shell=$(echo $SHELL | sed 's/\//\\\//g')
sed -i -e "s/\/bin\/zsh/$escaped_shell/g" .tmux.conf

git config --global user.email "jmeady@gmail.com"
git config --global user.name "James Eady"
git config --global color.ui "auto"
git config --global alias.history '!sh ~/.vim/scripts/git_history.sh'

echo
echo
echo ================
echo Have a nice day!
echo ================
echo
