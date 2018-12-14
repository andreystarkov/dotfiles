brew install zsh

if [[ ! -f $HOME/.zgen/zgen.zsh ]]; then
  git clone https://github.com/tarjoilija/zgen $HOME/.zgen
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew install exa
brew install colorls
brew install neovim


