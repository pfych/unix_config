#!/bin/zsh

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

checkout() {
  is_in_git_repo || return
  BRANCH=$(git branch -a | sed -e 's/^ *//g' -e '/HEAD ->/d' -e 's/remotes\///g' | fzf-down)
  case "$BRANCH" in
    *"origin"*) git checkout --track $BRANCH ;;
    *) git checkout $BRANCH ;;
  esac
}

commit() {
  is_in_git_repo || return
  git commit -m "[`git rev-parse --abbrev-ref HEAD | cut -f1,2 -d -`] $*"
}
