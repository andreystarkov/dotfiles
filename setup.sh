#!/bin/bash

source ~/dotfiles/install.sh
# source ~/dotfiles/mac/default-settings.sh

rm -rf ~/.zshrc ~/.zsh_aliases ~/.vimrc ~/.zgen_setup ~/.zsh_functions

ln -s ~/dotfiles/zsh/zshrc.zsh ~/.zshrc
ln -s ~/dotfiles/zsh/zsh_aliases.zsh ~/.zsh_aliases
ln -s ~/dotfiles/zsh/zsh_functions.zsh ~/.zsh_functions
ln -s ~/dotfiles/zsh/zgen_setup.zsh ~/.zgen_setup
ln -s ~/dotfiles/vimrc.js/vimrc §~/.vimrc
ln -s ~/dotfiles/vimrc.js ~/.vimrc.js

mkdir -p ~/.config
mkdir -p ~/.config/nvim

ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

ln -s ~/dotfiles/colorls ~/.config/colorls

zsh
