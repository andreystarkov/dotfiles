#!/bin/bash

# source $HOME/.dotfiles/install.sh
# source $HOME/.dotfiles/mac/default-settings.sh

sudo rm -rf $HOME/.zshrc $HOME/.zsh_aliases $HOME/.vimrc $HOME/.aliases $HOME/.zgen_setup $HOME/.inputrc $HOME/.screenrc $HOME/.exports $HOME/.zsh_functions $HOME/.exports $HOME/.bash_prompt $HOME/.bashrc $HOME/.bash_profile

ln -s $HOME/.dotfiles/zsh/zshrc.zsh $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/zsh_aliases.zsh $HOME/.zsh_aliases
ln -s $HOME/.dotfiles/zsh/zsh_functions.zsh $HOME/.zsh_functions
ln -s $HOME/.dotfiles/zsh/zgen_setup.zsh $HOME/.zgen_setup
ln -s $HOME/.dotfiles/vimrc.js/vimrc /.vimrc
ln -s $HOME/.dotfiles/vimrc.js $HOME/.vimrc.js
ln -s $HOME/.dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/.dotfiles/.bash_profile $HOME/.bash_profile
ln -s $HOME/.dotfiles/.bash_prompt $HOME/.bash_prompt
ln -s $HOME/.dotfiles/.exports $HOME/.exports
ln -s $HOME/.dotfiles/.inputrc $HOME/.inputrc
ln -s $HOME/.dotfiles/.screenrc $HOME/.screenrc
ln -s $HOME/.dotfiles/.aliases $HOME/.aliases

mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim

ln -s $HOME/.dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim

ln -s $HOME/.dotfiles/colorls $HOME/.config/colorls

zsh
