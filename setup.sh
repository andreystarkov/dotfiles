#!/bin/bash
rm -rf ~/.zshrc ~/.zsh_aliases ~/.zsh_functions ~/.zgen-setup

ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/zsh_aliases ~/.zsh_aliases
ln -s ~/dotfiles/zsh/zsh_functions ~/.zsh_functions
ln -s ~/dotfiles/zsh/zgen-setup ~/.zgen-setup
ln -s ~/dotfiles/vimrc.js/vimrc ~/.vimrc`

mkdir -p ~/.config

ln -s ~/dotfiles/colorls ~/.config/colorls