#!/bin/bash
while :
do
    read -p "uninstall dotfiles? y/n " yn
    if [ $yn = "n" -o $yn = "N" ]; then
        exit
    elif [ $yn = "y" -o $yn = "Y" ]; then
        break
    else
        continue
    fi
done

if [ $(pwd) = $HOME/dotfiles ]; then
    cd $HOME
fi

DOT_FILES=( .vimrc .vim/bundle dotfiles )

for file in ${DOT_FILES[@]}
do
    rm -rf $HOME/$file
done
