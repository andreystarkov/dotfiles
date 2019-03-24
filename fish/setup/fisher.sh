#!/usr/bin/env fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

export GREP_OPTIONS=

fisher add edc/bass
fisher add jorgebucaran/fish-bax

fisher add igalic/anicode
fisher add fishpkg/fish-await
fisher add oh-my-fish/plugin-battery
fisher add oh-my-fish/theme-bobthefish
fisher add laughedelic/brew-completions

brew install terminal-notifier
fisher add franciscolourenco/done

fisher add Shadowigor/plugin-errno-grep

brew install fzy
fisher add gyakovlev/fish-fzy

brew install grc
fisher add oh-my-fish/plugin-grc

brew install jq
fisher add oh-my-fish/plugin-license

fisher add oh-my-fish/plugin-node-binpath

fisher add oh-my-fish/plugin-pj
set -U PROJECT_PATHS ~/Library/Projects

fisher add fisherman/shark
fisher add Markcial/upto
fisher add jethrokuan/z
fisher add laughedelic/pisces

fisher add rodrigobdz/fish-apple-touchbar

fisher add matchai/spacefish