# Path
export PATH="${PATH}:${HOME}/.local/bin"
export CONFIGDIR="${HOME}/.config"
export XDG_CONFIG_HOME=$CONFIGDIR

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

## OS Specific Path
#case $OSTYPE in
#  darwin*)
#    export PATH="${PATH}:/Users/noahheague/Library/Python/3.7/bin"
#    alias walMac="${HOME}/scripts/wal";;
#esac

# oh-my-zsh
export ZSH="$CONFIGDIR/oh-my-zsh"
plugins=(git-prompt git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# NVM
export NVM_DIR="$CONFIGDIR/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Autocomplete
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Prompt
function precmd {
  PROMPT="🌊 [%c] "
  RPROMPT="$(git_super_status)"
}

# Wal
# (cat ~/.cache/wal/sequences &)

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Nodejs
export SKIP_PREFLIGHT_CHECK=true

# FZF
export FZF_DEFAULT_COMMAND='find . -type d \( -name node_modules -o -name .git -o -path name \) -prune -false -o -name "*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.config/scripts/custom_fzf.sh

# Better dig
source ~/.config/scripts/dig.sh

# Scratchpad command
source ~/.config/scripts/scratch.sh

#Encrypt Files
source ~/.config/scripts/encrypt.sh 

# Vent
source ~/.config/scripts/vent.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/noah/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/noah/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/noah/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/noah/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export TERM=xterm-256color
