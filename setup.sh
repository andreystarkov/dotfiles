#!/bin/bash

# source $PWD/install.sh
# source $PWD/mac/default-settings.sh

sudo rm -rf $HOME/.zshrc $HOME/.zsh_aliases $HOME/.vimrc $HOME/.aliases $HOME/.zgen_setup $HOME/.inputrc $HOME/.screenrc $HOME/.exports $HOME/.zsh_functions $HOME/.exports $HOME/.bash_prompt $HOME/.bashrc $HOME/.bash_profile

ln -s $PWD/zsh/zshrc.zsh $HOME/.zshrc
ln -s $PWD/zsh/zsh_aliases.zsh $HOME/.zsh_aliases
ln -s $PWD/zsh/zsh_functions.zsh $HOME/.zsh_functions
ln -s $PWD/zsh/zgen_setup.zsh $HOME/.zgen_setup
ln -s $PWD/vimrc.js/vimrc /.vimrc
ln -s $PWD/vimrc.js $HOME/.vimrc.js
ln -s $PWD/.bashrc $HOME/.bashrc
ln -s $PWD/.bash_profile $HOME/.bash_profile
ln -s $PWD/.bas h_prompt $HOME/.bash_prompt
ln -s $PWD/.exports $HOME/.exports
ln -s $PWD/.inputrc $HOME/.inputrc
ln -s $PWD/.screenrc $HOME/.screenrc
ln -s $PWD/.aliases $HOME/.aliases

mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim

ln -s $PWD/nvim/init.vim $HOME/.config/nvim/init.vim

ln -s $PWD/colorls $HOME/.config/colorls

zsh
