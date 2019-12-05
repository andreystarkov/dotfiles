#!/bin/bash

echo "🍓 Installing Mac hacks..."
# source ~/install.sh
source ~/mac/default-settings.sh


HOMEWORLD=~/.dotfiles

echo "🎁 Your configuration word will be stored at ${HOMEWORLD}"

echo "🚀 Copying ${PWD}"
echo "👇 To ~/.dotfiles"

cp -rf ./Desktop/code/dotfiles ~/.dotfiles

echo "🔪 Backuping pervous setup to ~/backup"
mkdir ~/backup

echo "🌩😩 It's okay if something fails here."

sudo mv -f ~/.zshrc ~/backup
sudo mv -f ~/.zsh_aliases ~/backup
sudo mv -f ~/.vimrc ~/.aliases ~/backup
sudo mv -f ~/.zgen_setup ~/backup
sudo mv -f ~/.inputrc ~/backup
sudo mv -f ~/.screenrc ~/backup
sudo mv -f ~/.exports ~/backup
sudo mv -f ~/.zsh_functions ~/backup
sudo mv -f ~/.exports ~/backup
sudo mv -f ~/.bash_prompt ~/backup
sudo mv -f ~/.bashrc ~/backup
sudo mv -f ~/.bash_profile ~/backup

echo "🔪 Removing prevous config..."
echo "😩 It's okay."

rm -rf ~/.zshrc
rm -rf ~/.zsh_aliases
rm -rf ~/.vimrc
rm -rf ~/.aliases
rm -rf ~/.zgen_setup
rm -rf ~/.inputrc
rm -rf ~/.screenrc
rm -rf ~/.exports
rm -rf ~/.zsh_functions
rm -rf ~/.exports
rm -rf ~/.bash_prompt
rm -rf ~/.bashrc
rm -rf ~/.bash_profile

echo "🍆 Setting up Everything."
echo "👉👈 Linking all your configs with ${HOMEWORLD}"

ln -s ~/dotfiles/zsh/zshrc.zsh ~/.zshrc
ln -s ~/.dotfiles/zsh/zsh_aliases.zsh ~/.zsh_aliases
ln -s ~/.dotfiles/zsh/zsh_functions.zsh ~/.zsh_functions
ln -s ~/.dotfiles/powerlevel9/defaulttheme.zsh ~/.powerlevel9

ln -s ~/.zgen_setup ~/.dotfiles/zsh/zgen_setup.zsh
ln -s ~/.dotfiles/vimrc.js/vimrc /.vimrc
ln -s ~/.dotfiles/vimrc.js ~/.vimrc.js
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/.bash_prompt ~/.bash_prompt
ln -s ~/.dotfiles/.exports ~/.exports
ln -s ~/.dotfiles/.inputrc ~/.inputrc
ln -s ~/.dotfiles/.screenrc ~/.screenrc
ln -s ~/.dotfiles/.aliases ~/.aliases

mkdir -p ~/.config
mkdir -p ~/.config/nvim

ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# ln -s ~/.dotfiles/colorls ~/.config/colorlsx

echo "💣 Enjoy that. Now zsh install all 🍓 plugins."

zsh

echo "💣 🔪🔪🔪 Done. Enjoy that."
