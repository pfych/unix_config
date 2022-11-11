# *nix config
Dot-files and scripts to be synced between my home system and work system

# Script summaries
All of the scripts that are referenced in `.zshrc` and what they do

### `./scripts/compress.sh`
- `decimate <file>`
  - Removes all duplicate or similar frames from an MP4
- `drive-by`
  - Convert all non-transparent `.png` to `.jpg` and compress transparent `.png` in current directory
### `./scripts/dig.sh`
- `ezdig <url>`
  - Get `CNAME`, `NS`, `A`, and `MX` records from `1.1.1.1` for domain
### `./scripts/encrypt.sh`
- `encrypt <file>`
  - Generate an encrypted file with a password and output command to decrypt
- `salted-uuid <salt>`
  - Generate a UUID with a salt value
### `./scripts/git_fzf.sh`
- `checkout`
  - List all branches and present them via fzf
- `commit "<message>"`
  - Commit staged files with branch issue number appended
- `add`
  - List files and use fzf to pick files to add
- `restore`
  - List files and use fzf to pick files to restore
### `./scripts/rg_fzf.sh`
- `rgfzf`
  - Index all file content from current directory recursively and offer fuzzy search, opens file at searched content in vim.
### `./scripts/scratch.sh`
- `scratch`
  - Create a markdown file at `~/Documents/Scratchpad` named after the current date
- `wscratch`
  - Create a markdown file at `~/Documents/Scratchpad-write` named after the current date with a template header for my blog
- `nscratch`
  - Create a markdown file at `~/Documents/Scratchpad-now` named after the current date with a template header for my now page on my site
- `codeScratch <dependencies>`
  - Create an instant typescript NodeJS project with all `<dependencies>` installed, starts tmux split session with vim at the top and the process running bellow.
### `./scripts/thumb.sh`
- `thumb <video>`
  - Create a 5x5 grid summary image of supplied video