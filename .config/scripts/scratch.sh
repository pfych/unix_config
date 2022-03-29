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
