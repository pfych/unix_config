#!/bin/zsh

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

checkout() {
  is_in_git_repo || return
  BRANCH=$(git branch -a | sed -e 's/^ *//g' -e '/HEAD ->/d' -e 's/remotes\///g' | fzf --border --query "$1")
  case "$BRANCH" in
    *"origin"*) git checkout --track $BRANCH ;;
    *) git checkout $BRANCH ;;
  esac
}

commit() {
  is_in_git_repo || return
  git commit -m "[`git rev-parse --abbrev-ref HEAD | cut -f1,2 -d - | cut -f2 -d /`] $*"
}

add() {
  is_in_git_repo || return
  git add `git status | grep modified: | sed -e 's/ *.*: *//g' | fzf -m`
  git status
}

push() {
  is_in_git_repo || return
  ./scripts/increase-version.sh `echo 'patch\nminor\nmajor' | fzf`
  git push
}

# Restore unstaged files
restore() {
  is_in_git_repo || return
  # TODO Adjust this to only list unstaged files!
  git restore `git status | grep modified: | sed -e 's/ *.*: *//g' | fzf -m`
  git status
}
