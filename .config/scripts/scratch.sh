#!/bin/bash

# TODO Suport input like "tomorrow", "today" etc
function scratch () {
  requestedDate=$(date +"%y-%m-%d")
  vim ~/Documents/Scratchpad/$requestedDate.md 
}

function wscratch () {
  requestedDate=$(date +"%y-%m-%d")
  vim ~/Documents/Scratchpad-write/$requestedDate-write.md 
}

function fscratch() {
  grep -Rl -e "$(find ~/Documents/Scratchpad/* -type f -exec cat {} \; | fzf)" ~/Documents/Scratchpad | xargs -o vim
}

function codeScratch () {
  cd ~/Developer/Scratch/
  DATE=$(date +"%y-%m-%d")
  if test ! -d "$(pwd)/$DATE"; then
    mkdir "$(pwd)/$DATE";
    cd "$(pwd)/$DATE"
    
    # Setup project
    yarn init -y
    yarn add @types/node ts-node-dev typescript prettier -D
    if test ! $# -eq 0; then
      yarn add $*
    fi

    # Essential files
    echo '{"compilerOptions": {"module": "commonjs","esModuleInterop": true,"target": "es6","moduleResolution": "node","sourceMap": true,"outDir": "dist"},"lib": ["es2015"]}' > tsconfig.json
    echo 'module.exports={semi: true,singleQuote: true,tabWidth: 2,trailingComma: 'all',arrowParens: 'always',printWidth: 80};' > .prettierrc.js
    echo 'console.log("hello world")' > scratch.ts
    jq '.scripts = { start: "ts-node-dev --respawn scratch.ts" }' package.json > tmp.json
    rm package.json
    mv tmp.json package.json
  fi
  
  # Start editor session
  tmux new-session \; \
    send-keys 'vim scratch.ts' C-m \; \
    split-window -v \; \
    send-keys 'yarn start' C-m \;
}

