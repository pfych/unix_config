#!/bin/zsh

fzf-down() {
  fzf --height 50% "$@" --border
}

fcd() {
  cd $(fzf-down)
}

