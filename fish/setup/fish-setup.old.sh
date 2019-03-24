rm -rf $HOME/.config/fish
ln -s ./ ~/.config/fish

wget https://git.io/fundle -O ./functions/fundle.fish

mkdir -p ~/.config/fish/functions

# wget https://git.io/fundle -O ~/.config/fish/functions/fundle.fish
wget https://git.io/fisher -O ~/.config/fish/functions/fisher.fish

fish install --path=~/.local/share/omf --config=~/.config/omf

brew install jq &&
brew install grc &&
brew install thefuck &&
omf install spark &&
omf install license &&
omf install battery &&
omf install git-flow &&
omf install await &&
omf install hash &&
omf install errno &&
omf install brew &&
omf install node-binpath &&
omf install grc &&
omf install pj &&
set -gx PROJECT_PATHS ~/Library/Projects &&
omf install thefuck

# Prompts

fisher add matchai/spacefish

# Utilities

fisher add jorgebucaran/fish-getopts # Automatically receive notifications when a long process finish
fisher add franciscolourenco/done # Automatically receive notifications when a long process finish
fisher add jethrokuan/z # Pure-fish rupa/z-like directory jumping
fisher add jorgebucaran/fish-getopts # CLI options parser alternative to the argparse builtin
# fisher add jorgebucaran/fish-spark # Pure-fish sparkline generator
fisher add rodrigobdz/fish-apple-touchbar # Customize your Touch Bar in iTerm2

# Environment

fisher add danhper/fish-ssh-agent # Utility functions to start your ssh agent
fisher add edc/bass # Make bash utilities usable in fish
# fisher add jorgebucaran/fish-bax # Run bash utilities, replaying environment changes in fish without leaving the comfort of your session

# Key Bindings

fisher add jethrokuan/fzf # Improved key bindings for junegunn/fzf
fisher add laughedelic/pisces # Autoclose parentheses, braces, quotes and other paired symbols
fisher add oh-my-fish/plugin-bang-bang # bash style history substitution

# Node.js

# fisher add brigand/fast-nvm-fish # Enhanced nvm wrapper optimized for speed
# fisher add FabioAntunes/fish-nvm # Completion-rich, true nvm wrapper
# fisher add jorgebucaran/fish-nvm # Pure-fish, no nonsense Node.js version manager
fisher add danhper/fish-fastdir
fisher add jorgebucaran/fzf