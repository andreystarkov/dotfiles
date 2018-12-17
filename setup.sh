#!/bin/bash

source $HOME/.dotfiles/install.sh
source $HOME/.dotfiles/mac/default-settings.sh

sudo rm -rf $HOME/.zshrc $HOME/.zsh_aliases $HOME/.vimrc $HOME/.zgen_setup $HOME/.zsh_functions

ln -s $HOME/.dotfiles/zsh/zshrc.zsh $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/zsh_aliases.zsh $HOME/.zsh_aliases
ln -s $HOME/.dotfiles/zsh/zsh_functions.zsh $HOME/.zsh_functions
ln -s $HOME/.dotfiles/zsh/zgen_setup.zsh $HOME/.zgen_setup
ln -s $HOME/.dotfiles/vimrc.js/vimrc /.vimrc
ln -s $HOME/.dotfiles/vimrc.js $HOME/.vimrc.js

mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim

ln -s $HOME/.dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim

ln -s $HOME/.dotfiles/colorls $HOME/.config/colorls

zsh
