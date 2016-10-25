#!/bin/bash

echo 'backing up'
cp ~/.vim/ ~/.vim.$(date +%Y%m%d%H%M%S).bak
cp ~/.vimrc ~/.vimrc.$(date +%Y%m%d%H%M%S).bak

echo 'setting up vim plug'
\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'symlinking vimrc'
ln -s $(pwd)/vimrc ~/.vimrc

echo 'install vim plugs'
vim +PlugInstall
