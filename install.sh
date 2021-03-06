#!/bin/bash
CONFIG=$HOME/config

mkdir -p $HOME/bin $HOME/.vim/bundle

function install_update_repo {
# will install or update the git repo to the given directory
# install_update_repo url directory
if [ -d "$2" ];then
    pushd "$2" >/dev/null
    echo $1
    git pull
    popd >/dev/null
else
    git clone "$1" "$2"
fi
}

install_update_repo https://github.com/gmarik/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
install_update_repo https://github.com/robbyrussell/oh-my-zsh "$HOME/.oh-my-zsh"

function mksymlink {
# will make the symlink onlt if the file doesn't exist
# mkksymlink target linkname
if [ ! -e "$2" ];then
    ln -s "$1" "$2"
fi
}

. ~/.aliases
echo "echo 'source ~/.variables' >> ~/.bashrc"
echo "echo 'source ~/.aliases' >> ~/.bashrc"
