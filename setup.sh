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
git clone http://github.com/Shougo/neobundle.vim.git
git clone http://github.com/Shougo/vimproc.git

cd vimproc
ENVS=(unix mac cygwin other)
echo plz select ur env
select env in ${ENVS[*]}
do
    if [ -z $env ]; then
        continue
    elif [ $env = "other" ]; then
        echo plz make vimproc by urself
        break
    else
        make -f make_$env.mak
        break
    fi
done

cd ${ORIGIN}
vim -c "NeoBundleInstall" -c q
