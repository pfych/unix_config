#!/bin/zsh

fzf-down() {
  fzf --height 50% "$@" --border
}

fidea() {
  idea $(fzf-down)
}

fstorm() {
  webstorm $(fzf-down)
}
