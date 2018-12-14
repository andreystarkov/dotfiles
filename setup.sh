#!/bin/bash

if [[ ! -f $HOME/.zgen/zgen.zsh ]]; then
  git clone https://github.com/tarjoilija/zgen $HOME/.zgen
fi

if ! [ -x "$(command -v colorls)" ]; then
  brew install colorls
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rm -rf ~/.zshrc ~/.zsh_aliases ~/.zsh_functions ~/.zgen-setup

ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/zsh_aliases ~/.zsh_aliases
ln -s ~/dotfiles/zsh/zsh_functions ~/.zsh_functions
ln -s ~/dotfiles/zsh/zgen-setup ~/.zgen-setup
ln -s ~/dotfiles/vimrc.js/vimrc ~/.vimrc
ln -s ~/dotfiles/vimrc.js ~/.vimrc.js

mkdir -p ~/.config

ln -s ~/dotfiles/colorls ~/.config/colorls

zsh