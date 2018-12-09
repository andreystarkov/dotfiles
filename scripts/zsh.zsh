if [[ -z "$ZGEN_PARENT_DIR" ]]; then
  ZGEN_PARENT_DIR=$HOME
fi
if [[ ! -f $ZGEN_PARENT_DIR/zgen/zgen.zsh ]]; then
  if [[ ! -d "$ZGEN_PARENT_DIR" ]]; then
    mkdir -p "$ZGEN_PARENT_DIR"
  fi
  pushd $ZGEN_PARENT_DIR
  git clone https://github.com/tarjoilija/zgen
  popd
fi
source $ZGEN_PARENT_DIR/.zgen/zgen.zsh
unset ZGEN_PARENT_DIR

load-starter-plugin-list() {
  echo "Creating a zgen save"
  ZGEN_LOADED=()
  ZGEN_COMPLETIONS=()

  zgen oh-my-zsh

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search

  # Set keystrokes for substring searching
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down


zgen oh-my-zsh plugins/colorize
zgen oh-my-zsh plugins/command-not-found
zgen oh-my-zsh plugins/git
zgen oh-my-zsh plugins/pip
zgen oh-my-zsh plugins/jump
zgen oh-my-zsh plugins/yarn
zgen oh-my-zsh plugins/lein
zgen oh-my-zsh plugins/common-aliases
zgen oh-my-zsh plugins/autojump
zgen oh-my-zsh plugins/docker
zgen oh-my-zsh plugins/gitfast
zgen oh-my-zsh plugins/git-extras
zgen oh-my-zsh plugins/git-flow
zgen oh-my-zsh plugins/history
zgen oh-my-zsh plugins/lol
zgen oh-my-zsh plugins/osx
zgen oh-my-zsh plugins/tmux
zgen oh-my-zsh plugins/vscode
zgen oh-my-zsh plugins/z
zgen oh-my-zsh plugins/brew
# zgen oh-my-zsh plugins/chucknorris
zgen oh-my-zsh plugins/command-not-found
zgen oh-my-zsh plugins/Composer
zgen oh-my-zsh plugins/common-aliases
zgen oh-my-zsh plugins/copyfile
zgen oh-my-zsh plugins/encode64
zgen oh-my-zsh plugins/compleat
zgen oh-my-zsh plugins/dircycle
zgen oh-my-zsh plugins/dirhistory
zgen oh-my-zsh plugins/npm

# zgen load bhilburn/powerlevel9k powerlevel9k
zgen load denysdovhan/spaceship-prompt spaceship

zgen load arialdomartini/oh-my-git
zgen load arialdomartini/oh-my-git-themes oppa-lana-style

zgen load zsh-users/zsh-completions
zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-history-substring-search
zgen load zsh-users/zsh-autosuggestions
zgen load chrissicool/zsh-256color
zgen load pawelad/honukai-iterm-zsh
zgen load pawelad/honukai-iterm-zsh honukai

zgen load unixorn/rake-completion.zshplugin
zgen load unixorn/autoupdate-zgen
# zgen load unixorn/jpb.zshplugin
zgen load unixorn/warhol.plugin.zsh
zgen load unixorn/tumult.plugin.zsh
zgen load djui/alias-tips
zgen load unixorn/git-extra-commands
zgen load unixorn/bitbucket-git-helpers.plugin.zsh
zgen load skx/sysadmin-util
zgen load peterhurford/git-it-on.zsh
zgen load StackExchange/blackbox
zgen load supercrabtree/k
zgen load b4b4r07/enhancd
zgen load fcambus/ansiweather
zgen load iam4x/zsh-iterm-touchbar
zgen load lukechilds/zsh-better-npm-completion
zgen load g-plane/zsh-yarn-autocompletions
zgen load djui/alias-tips

  if [ $(uname -a | grep -ci Darwin) = 1 ]; then
    # Load macOS-specific plugins
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/osx
  fi

  # A set of shell functions to make it easy to install small apps and
  # utilities distributed with pip.
  zgen load sharat87/pip-app

  zgen load chrissicool/zsh-256color

  # Load more completion files for zsh from the zsh-lovers github repo.
  zgen load zsh-users/zsh-completions src

  # Docker completion
  zgen load srijanshetty/docker-zsh

  # Load me last
  GENCOMPL_FPATH=$HOME/.zsh/complete

  # Very cool plugin that generates zsh completion functions for commands
  # if they have getopt-style help text. It doesn't generate them on the fly,
  # you'll have to explicitly generate a completion, but it's still quite cool.
  zgen load RobSis/zsh-completion-generator

  # Add Fish-like autosuggestions to your ZSH.
  zgen load zsh-users/zsh-autosuggestions

  # k is a zsh script / plugin to make directory listings more readable,
  # adding a bit of color and some git status information on files and
  # directories.
  zgen load supercrabtree/k

  # Bullet train prompt setup.
  zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

  # Save it all to init script.
  zgen save
}

setup-zgen-repos() {
  if [[ -f ~/.zgen-local-plugins ]]; then
    source ~/.zgen-local-plugins
  else
    load-starter-plugin-list
  fi
}

# This comes from https://stackoverflow.com/questions/17878684/best-way-to-get-file-modified-time-in-seconds
# This works on both Linux with GNU fileutils and macOS with BSD stat.

# Naturally BSD/macOS and Linux can't share the same options to stat.
if [[ $(uname | grep -ci -e Darwin -e BSD) = 1 ]]; then

  # macOS version.
  get_file_modification_time() {
    modified_time=$(stat -f %m "$1" 2> /dev/null) || modified_time=0
    echo "${modified_time}"
  }

elif [[ $(uname | grep -ci Linux) = 1 ]]; then

  # Linux version.
  get_file_modification_time() {
    modified_time=$(stat -c %Y "$1" 2> /dev/null) || modified_time=0
    echo "${modified_time}"
  }
fi

# check if there's an init.zsh file for zgen and generate one if not.
if ! zgen saved; then
  setup-zgen-repos
fi

# Our installation instructions get the user to make a symlink
# from ~/.zgen-setup to wherever they checked out the zsh-quickstart-kit
# repository.
#
# Unfortunately, stat will return the modification time of the
# symlink instead of the target file, so construct a full path to hand off
# to stat so it returns the modification time of the actual .zgen-setup file.
if [[ -f ~/.zgen-setup ]]; then
  REAL_ZGEN_SETUP=~/.zgen-setup
fi
if [[ -L ~/.zgen-setup ]]; then
  REAL_ZGEN_SETUP="$(readlink ~/.zgen-setup)"
fi

# If you don't want my standard starter set of plugins, create a file named
# .zgen-local-plugins and add your zgen load commands there. Don't forget to
# run `zgen save` at the end of your .zgen-local-plugins file.
#
# Warning: .zgen-local-plugins REPLACES the starter list setup, it doesn't
# add to it.
#
# Use readlink in case the user is symlinking from another repo checkout, so
# they can use a personal dotfiles repository cleanly.
if [[ -f ~/.zgen-local-plugins ]]; then
  REAL_ZGEN_SETUP=~/.zgen-local-plugins
fi
if [[ -L ~/.zgen-local-plugins ]]; then
  REAL_ZGEN_SETUP="${HOME}/$(readlink ~/.zgen-local-plugins)"
fi

# If .zgen-setup is newer than init.zsh, regenerate init.zsh
if [ $(get_file_modification_time ${REAL_ZGEN_SETUP}) -gt $(get_file_modification_time ~/.zgen/init.zsh) ]; then
  echo "$(basename ${REAL_ZGEN_SETUP}) updated; creating a new init.zsh"
  setup-zgen-repos
fi
unset REAL_ZGEN_SETUP