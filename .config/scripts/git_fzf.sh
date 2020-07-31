#!/bin/zsh

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

checkout() {
  is_in_git_repo || return
  git checkout $(git branch | fzf-down)
}
