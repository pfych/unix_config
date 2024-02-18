# Path
if [[ $(uname) == "Darwin" ]]; then
  export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH:${HOME}/.local/bin:/usr/local/sbin:${HOME}/.local/share/gem/ruby/2.0.0/bin:/usr/local/bin"
  alias date=gdate;
  eval "$(/opt/homebrew/bin/brew shellenv)"
  alias twtxt="AWS_PROFILE=personal twtxt -c .config/twtxt/config"
  export ANDROID_SDK_ROOT=/Users/$USER/Library/Android/sdk
  eval "$(rbenv init - zsh)"
else
  export PATH="${PATH}:${HOME}/.local/bin:/usr/local/sbin:${HOME}/.local/share/gem/ruby/2.0.0/bin:/usr/local/bin"
fi

export CONFIGDIR="${HOME}/.config"
export XDG_CONFIG_HOME=$CONFIGDIR
export IPFS_PATH=/mnt/kachow/ipfs
export EDITOR=nvim

export ZSH_DIR="$CONFIGDIR/oh-my-zsh"
export ZSH_CUSTOM="$ZSH_DIR/custom"

export TERM=xterm-256color

# Text colours
export BLACK_TEXT="\033[30m"
export RED_TEXT="\033[31m"
export GREEN_TEXT="\033[32m"
export ORANGE_TEXT="\033[33m"
export BLUE_TEXT="\033[34m"
export MAGENTA_TEXT="\033[35m"
export CYAN_TEXT="\033[36m"
export LIGHT_GREY_TEXT="\033[37m"
export DEFAULT_TEXT="\033[39m"

# Background colours
export BLACK_BACKGROUND="\033[40m"
export RED_BACKGROUND="\033[41m"
export GREEN_BACKGROUND="\033[42m"
export ORANGE_BACKGROUND="\033[43m"
export BLUE_BACKGROUND="\033[44m"
export MAGENTA_BACKGROUND="\033[45m"
export CYAN_BACKGROUND="\033[46m"
export LIGHT_GREY_BACKGROUND="\033[47m"
export DEFAULT_BACKGROUND="\033[49m"

# oh-my-zsh
export ZSH="$CONFIGDIR/oh-my-zsh"
plugins=(git-prompt git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Use NVIM
alias vim=nvim

# NVM
export NVM_DIR="$CONFIGDIR/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Autocomplete
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Prompt
function precmd {
  PROMPT="[%c] "
  RPROMPT="$(git_super_status)"
}

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Nodejs
export SKIP_PREFLIGHT_CHECK=true

# FZF
export FZF_DEFAULT_COMMAND='find . -type d \( -name Pods -o -name .yarn -o -name node_modules -o -name .git -o -path name \) -prune -false -o -name "*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Better dig
source ~/.config/scripts/dig.sh

# Scratchpad command
source ~/.config/scripts/scratch.sh

# Encrypt Files
source ~/.config/scripts/encrypt.sh

# Thumb
source ~/.config/scripts/thumb.sh

# Compress
source ~/.config/scripts/compress.sh

# Ripgrep fzf
source ~/.config/scripts/rg_fzf.sh

# AWS Profile fzf
source ~/.config/scripts/aws-profile.sh

# Kill commands
source ~/.config/scripts/kill.sh

# thefuck
eval $(thefuck --alias)
alias a=fuck

# Better Git
function git() {
  case $* in
    rebase* ) HUSKY_SKIP_HOOKS=1 command git "$@";;
    * ) command git "$@"
  esac
}
source ~/.config/scripts/git_fzf.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/noah/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/noah/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/noah/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/noah/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
[ -f "/Users/noah/.ghcup/env" ] && source "/Users/noah/.ghcup/env" # ghcup-env

# bun completions
[ -s "/Users/noah/.bun/_bun" ] && source "/Users/noah/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Fuucckkkk python
if command -v pyenv; then
  export PYENV_ROOT="/mnt/kachow/pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
