export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Antigen
source ./antigen.zsh

antigen use oh-my-zsh

antigen bundle colorize
antigen bundle command-not-found
antigen bundle git
antigen bundle pip
antigen bundle jump
antigen bundle yarn
antigen bundle lein
antigen bundle common-aliases
antigen bundle autojump
antigen bundle docker
antigen bundle gitfast
antigen bundle git-extras
antigen bundle git-flow
antigen bundle history
antigen bundle lol
antigen bundle osx
antigen bundle tmux
antigen bundle vscode
antigen bundle z
antigen bundle brew
antigen bundle chucknorris
antigen bundle command-not-found
antigen bundle Composer
antigen bundle common-aliases
antigen bundle copyfile
antigen bundle encode64
antigen bundle compleat
antigen bundle dircycle
antigen bundle dirhistory

antigen bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes oppa-lana-style
#antigen bundle robbyrussell/oh-my-zsh plugins/gitfast
#antigen bundle robbyrussell/oh-my-zsh plugins/git-flow
antigen bundle robbyrussell/oh-my-zsh plugins/npm
antigen bundle robbyrussell/oh-my-zsh plugins/pip
# antigen bundle robbyrussell/oh-my-zsh plugins/autoenv
antigen bundle robbyrussell/oh-my-zsh plugins/virtualenvwrapper

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle chrissicool/zsh-256color
antigen bundle pawelad/honukai-iterm-zsh
antigen theme pawelad/honukai-iterm-zsh honukai

antigen bundle unixorn/rake-completion.zshplugin
antigen bundle unixorn/autoupdate-zgen
antigen bundle unixorn/jpb.zshplugin
antigen bundle unixorn/warhol.plugin.zsh
antigen bundle unixorn/tumult.plugin.zsh
antigen bundle djui/alias-tips
antigen bundle unixorn/git-extra-commands
antigen bundle unixorn/bitbucket-git-helpers.plugin.zsh
antigen bundle skx/sysadmin-util
antigen bundle peterhurford/git-it-on.zsh
antigen bundle StackExchange/blackbox
antigen bundle supercrabtree/k
antigen bundle b4b4r07/enhancd
antigen bundle fcambus/ansiweather
antigen bundle iam4x/zsh-iterm-touchbar
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle g-plane/zsh-yarn-autocompletions
antigen bundle djui/alias-tips

antigen theme bhilburn/powerlevel9k powerlevel9k
antigen theme denysdovhan/spaceship-prompt spaceship

antigen apply
