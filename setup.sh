#!/bin/bash
ORIGIN=$(pwd)

DOT_FILES=( .vimrc )

for file in ${DOT_FILES[@]}
do
    if [ -e $HOME/$file ]; then
        echo $HOME/$file exist. backup file $HOME/$file~ is created.
    fi
    ln -sb $HOME/dotfiles/$file $HOME/$file
done

mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim.git

cd ${ORIGIN}
vim -c "NeoBundleInstall" -c qa
