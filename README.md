# *nix config
Dotfiles and scripts to be sync'd between my home system and work system

## Summaries
### Git
`.config/scripts/git_fzf.sh`
- `commit <Message>` Automatically commit added files and append `[<branch-name>]` to the beginging 
- `add` Run fzf on all changed files and use `tab` to select them. Pressing `enter` will stage them
- `restore` Same as `add` but runs restore
- `checkout` List every branch localy and on origin in an easy to search list
### Navigation
Enusre your using the custom FZF command defined in `.zshrc`

`.config/scripts/cd_fzf.sh`  
- `fcd` A FZF implementation for `cd`

`.config/scripts/code_fzf.sh`  
- `fcode` A FZF implenetation for "Find and open in VSCode"

`.config/scripts/idea_fzf.sh`  
- `fidea` A FZF implenetation for "Find and open in Idea"
- `fstorm` A FZF implenetation for "Find and open in WebStorm"
### DNS
Ensure you've set the colour variables defined in `.zshrc`  
`.config/scripts/dig.sh`
- `ezdig <domain>` Show the following DNS records in a formated output:
  - NS
  - A
  - CNAME
  - MX
