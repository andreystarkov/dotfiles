if [[ -z "$ZGEN_PARENT_DIR" ]]; then
  ZGEN_PARENT_DIR=$HOME
fi
if [[ ! -f $ZGEN_PARENT_DIR/.zgen/zgen.zsh ]]; then
  if [[ ! -d "$ZGEN_PARENT_DIR" ]]; then
    mkdir -p "$ZGEN_PARENT_DIR"
  fi
  pushd $ZGEN_PARENT_DIR
  git clone https://github.com/tarjoilija/zgen ~/.zgen
  popd
fi

source $ZGEN_PARENT_DIR/.zgen/zgen.zsh
unset ZGEN_PARENT_DIR

load-starter-plugin-list() {
  echo "Creating a zgen save"
  ZGEN_LOADED=()
  ZGEN_COMPLETIONS=()

  zgen oh-my-zsh

  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down

  # zgen oh-my-zsh plugins/colorize
  # zgen oh-my-zsh plugins/command-not-found
  # zzgen oh-my-zsh plugins/git
  # zzgen oh-my-zsh plugins/github
  # zgen oh-my-zsh plugins/pip
  # zgen oh-my-zsh plugins/node
  # zgen oh-my-zsh plugins/sudo
  # zgen oh-my-zsh plugins/jump
  # zgen oh-my-zsh plugins/yarn
  # zgen oh-my-zsh plugins/lein
  # zgen oh-my-zsh plugins/common-aliases
  # zgen oh-my-zsh plugins/colored-man-pages
  # zgen oh-my-zsh plugins/autojump
  # zzgen oh-my-zsh plugins/docker
  # zzgen oh-my-zsh plugins/docker-compose
  # zzgen oh-my-zsh plugins/gitfast
  # zzgen oh-my-zsh plugins/git-extras
  # zgen oh-my-zsh plugins/git-flow
  zgen oh-my-zsh plugins/history
  # zgen load peterhurford/git-it-on.zsh
  # zgen oh-my-zsh plugins/lol
  # zgen oh-my-zsh plugins/tmux
  # zgen oh-my-zsh plugins/vscode
  # zgen oh-my-zsh plugins/z
  # zgen oh-my-zsh plugins/chucknorris
  # zgen oh-my-zsh plugins/Composer
  # zgen oh-my-zsh plugins/copyfile
  # zgen oh-my-zsh plugins/encode64
  # zgen oh-my-zsh plugins/compleat
  # zgen oh-my-zsh plugins/dircycle
  # zgen oh-my-zsh plugins/dirhistory
  zgen oh-my-zsh plugins/npm
  # zgen oh-my-zsh plugins/aws
  # zgen oh-my-zsh plugins/python
  # zgen oh-my-zsh plugins/screen
  # zgen oh-my-zsh plugins/vagrant
  # zgen oh-my-zsh plugins/rsync
  zgen load zsh-users/zsh-completions
  # zgen load RobSis/zsh-completion-generator
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-autosuggestions
  zgen load chrissicool/zsh-256color
  # zgen load unixorn/rake-completion.zshplugin
  zgen load unixorn/autoupdate-zgen
  # zgen load unixorn/jpb.zshplugin
  # zgen load unixorn/tumult.plugin.zsh
  zgen load djui/alias-tips
  # zgen load unixorn/git-extra-commands
  # zgen load unixorn/bitbucket-git-helpers.plugin.zsh
  # zgen load skx/sysadmin-util
  # zgen load StackExchange/blackbox
  # zgen load supercrabtree/k
  # zgen load b4b4r07/enhancd
  # zgen load fcambus/ansiweather
  zgen load iam4x/zsh-iterm-touchbar
  zgen load lukechilds/zsh-better-npm-completion
  zgen load g-plane/zsh-yarn-autocompletions
  zgen load unixorn/tumult.plugin.zsh
  # zgen load srijanshetty/docker-zsh
  zgen load zdharma/fast-syntax-highlighting
  zgen load oldratlee/hacker-quotes
  zgen load tysonwolker/iterm-tab-colors
  zgen load b4b4r07/emoji-cli
  zgen load Tarrasch/zsh-autoenv

  # zgen load denysdovhan/spaceship-prompt spaceship
  # zgen oh-my-zsh plugins/chucknorris
    if [ $(uname -a | grep -ci Darwin) = 1 ]; then
    zgen oh-my-zsh plugins/brew
    # zgen oh-my-zsh plugins/brew-cask
    zgen oh-my-zsh plugins/osx
    zgen load mkwmms/zsh-osx
  fi

  GENCOMPL_FPATH=$HOME/.zsh/complete

  zgen save
}

setup-zgen-repos() {
  if [[ -f ~/.zgen-local-plugins ]]; then
    source ~/.zgen-local-plugins
  else
    load-starter-plugin-list
  fi
}

# https://stackoverflow.com/questions/17878684/best-way-to-get-file-modified-time-in-seconds
if [[ $(uname | grep -ci -e Darwin -e BSD) = 1 ]]; then
  get_file_modification_time() {
    modified_time=$(stat -f %m "$1" 2> /dev/null) || modified_time=0
    echo "${modified_time}"
  }

elif [[ $(uname | grep -ci Linux) = 1 ]]; then
  get_file_modification_time() {
    modified_time=$(stat -c %Y "$1" 2> /dev/null) || modified_time=0
    echo "${modified_time}"
  }
fi

if ! zgen saved; then
  setup-zgen-repos
fi

if [[ -f ~/.zgen_setup ]]; then
  REAL_ZGEN_SETUP=~/.zgen_setup
fi

if [[ -L ~/.zgen_setup ]]; then
  REAL_ZGEN_SETUP="$(readlink ~/.zgen_setup)"
fi

if [[ -f ~/.zgen-local-plugins ]]; then
  REAL_ZGEN_SETUP=~/.zgen-local-plugins
fi
if [[ -L ~/.zgen-local-plugins ]]; then
  REAL_ZGEN_SETUP="${HOME}/$(readlink ~/.zgen-local-plugins)"
fi

# If .zgen_setup is newer than init.zsh, regenerate init.zsh
if [ $(get_file_modification_time ${REAL_ZGEN_SETUP}) -gt $(get_file_modification_time ~/.zgen/init.zsh) ]; then
  echo "$(basename ${REAL_ZGEN_SETUP}) updated; creating a new init.zsh"
  setup-zgen-repos
fi
unset REAL_ZGEN_SETUP
