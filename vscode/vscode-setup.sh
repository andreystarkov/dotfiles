#!/bin/bash

echo "
  Checking if VisualStudioCode is currently installed...
"

install() {
  if [ ! -z "$BASH_VERSION" ]; then
    source $HOME/.bashrc
  fi

  if [ ! -z "$ZSH_VERSION" ]; then
    source $HOME/.zshrc
  fi

  cp $(pwd)/vscode/extensions.json $HOME/Library/Application\ Support/Code/User/extensions.json
  echo "  Copied VisualStudioCode Extensions JSON"

  # cp $(pwd)/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
  # echo "  Copied VisualStudioCode Keybindings JSON"

  cp $(pwd)/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
  echo "  Copied VisualStudioCode Settings JSON"

  EXTENSIONS=($(code --list-extensions))
  for extension in "${EXTENSIONS[@]}"
  do
    printf "\e[1;32m\nInstalling \e[1;34m$extension\e[0m\n"
    code --install-extension ${extension}
    echo ""
  done

  echo "All done! installed ${#EXTENSIONS[@]} packages."
  sleep 1
  code
}

if hash code 2>/dev/null; then
  install
else
  brew cask install visual-studio-code
  install
fi


# DIR=$(dirname "$0")
# cd "$DIR"

# . ../scripts/functions.sh

# SOURCE="$(realpath .)"
# DESTINATION="$(realpath ~/Library/Application\ Support/Code/User)"

# info "Setting up Visual Studio Code..."

# substep_info "Creating Visual Studio Code folders..."
# mkdir -p "$DESTINATION"

# find * -not -name "$(basename ${0})" -type f | while read fn; do
#     symlink "$SOURCE/$fn" "$DESTINATION/$fn"
# done

# success "Finished setting up Visual Studio Code"

