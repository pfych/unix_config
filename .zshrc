# Path
export PATH="${PATH}:${HOME}/.local/bin"
export CONFIGDIR="${HOME}/.config"
export XDG_CONFIG_HOME=$CONFIGDIR

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
