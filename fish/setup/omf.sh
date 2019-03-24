#!/usr/bin/env fish

curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf

omf install brew

# omf install foreign-env

omf install bobthefish
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
omf install thefuck &&
omf install osx &&
omf install tab &&
omf install z