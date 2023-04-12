#!/bin/bash

function scratch () {
  requestedDate=$(date +"%y-%m-%d")
  vim ~/Documents/Scratchpad/$requestedDate.md
}

function wscratch () {
  requestedDate=$(date +"%y-%m-%d")
  if [ ! -e ~/Documents/Scratchpad-write/$requestedDate-write.md ]; then
    touch ~/Documents/Scratchpad-write/$requestedDate-write.md
    echo "---" >> ~/Documents/Scratchpad-write/$requestedDate-write.md
    echo "title: " >> ~/Documents/Scratchpad-write/$requestedDate-write.md
    echo "summary: " >> ~/Documents/Scratchpad-write/$requestedDate-write.md
    echo "image: " >> ~/Documents/Scratchpad-write/$requestedDate-write.md
    echo "alt: " >> ~/Documents/Scratchpad-write/$requestedDate-write.md
    echo "attribution: " >> ~/Documents/Scratchpad-write/$requestedDate-write.md
    echo "---" >> ~/Documents/Scratchpad-write/$requestedDate-write.md
  fi
  vim ~/Documents/Scratchpad-write/$requestedDate-write.md
}

function nscratch () {
  requestedDate=$(date +"%y-%m-%d")
  if [ ! -e ~/Documents/Scratchpad-now/$requestedDate-write.md ]; then
    touch ~/Documents/Scratchpad-now/$requestedDate-write.md
    echo "---" >> ~/Documents/Scratchpad-now/$requestedDate-write.md
    echo "title: " >> ~/Documents/Scratchpad-now/$requestedDate-write.md
    echo "---" >> ~/Documents/Scratchpad-now/$requestedDate-write.md
    echo "" >> ~/Documents/Scratchpad-now/$requestedDate-write.md
    echo "Today I " >> ~/Documents/Scratchpad-now/$requestedDate-write.md
  fi
  vim ~/Documents/Scratchpad-now/$requestedDate-write.md
}

function codeScratch () {
  cd ~/Developer/Scratch/ || exit
  DATE=$(date +"%y-%m-%d")
  if test ! -d "$(pwd)/$DATE"; then
    mkdir "$(pwd)/$DATE";
    cd "$(pwd)/$DATE" || exit

    # Setup project
    pnpm init
    pnpm install @types/node ts-node-dev typescript prettier -D
    if test ! $# -eq 0; then
      # shellcheck disable=SC2086
      pnpm install $*
    fi

    # Essential files
    echo '{"compilerOptions": {"module": "commonjs","esModuleInterop": true,"target": "es6","moduleResolution": "node","sourceMap": true,"outDir": "dist"},"lib": ["es2015"]}' > tsconfig.json
    echo 'module.exports={semi: true,singleQuote: true,tabWidth: 2,trailingComma: "all",arrowParens: "always",printWidth: 80};' > .prettierrc.js
    echo 'console.log("hello world")' > scratch.ts
    jq '.scripts = { start: "ts-node-dev --respawn scratch.ts" }' package.json > tmp.json
    rm package.json
    mv tmp.json package.json
  else
    cd "$(pwd)/$DATE"
  fi
  # Start editor session
  # tmux new-session \; \
  #  send-keys 'vim scratch.ts' C-m \; \
  #  split-window -v \; \
  #  send-keys 'yarn start' C-m \;
}

