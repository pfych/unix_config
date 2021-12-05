#!/bin/bash

# TODO Suport input like "tomorrow", "today" etc
function scratch () {
  requestedDate=$(date +"%d-%m-%y")
  vim ~/Documents/Scratchpad/$requestedDate.md 
}

function wscratch () {
  requestedDate=$(date +"%d-%m-%y")
  vim ~/Documents/Scratchpad-write/$requestedDate-write.md 
}

function fscratch() {
  grep -Rl -e "$(find ~/Documents/Scratchpad/* -type f -exec cat {} \; | fzf)" ~/Documents/Scratchpad | xargs -o vim
}
