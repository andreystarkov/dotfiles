brew install zsh

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew install exa
brew install neovim
brew install stow

# wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
# echo 'eval $(dircolors -b $HOME/.dircolors)' >> $HOME/.zshrc
# . $HOME/.zshrcx§
