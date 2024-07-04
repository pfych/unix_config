#!/bin/zsh

function is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

function fzf-down() {
  fzf --height 50% "$@" --border
}

function checkout() {
  is_in_git_repo || return
  BRANCH=$(git branch -a | sed -e 's/^ *//g' -e '/HEAD ->/d' -e 's/remotes\///g' | fzf --border --query "$1")
  case "$BRANCH" in
    *"origin"*) git checkout --track "$BRANCH" ;;
    *) git checkout "$BRANCH" ;;
  esac
}

function commit() {
  is_in_git_repo || return
  BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD | cut -f1,2 -d - | cut -f2 -d /)

  if git status | grep -q "serverless.yml"; then
    echo "$RED_TEXT\nAre you sure you want to commit serverless.yml?"
    select answer in "Yes" "No"; do
      case $answer in
        Yes ) break;;
        No ) return 1;;
      esac
    done
  fi

  if test "$BRANCH_NAME" != 'master' -a "$BRANCH_NAME" != 'main' -a "$BRANCH_NAME" != 'rnd'; then
    git commit -m "[$BRANCH_NAME] $*"
  else
    echo "$RED_TEXT\nAre you sure you want to commit directly to $BRANCH_NAME?$DEFAULT_TEXT"
    select answer in "Yes" "No"; do
      case $answer in
        Yes ) git commit -m "$*"; break;;
        No ) return 1;;
      esac
    done
  fi
}

function add() {
  is_in_git_repo || return
  git add $(git status | grep modified: | sed -e 's/ *.*: *//g' | tac | fzf -m)
  git status
}

# Restore unstaged files
function restore() {
  is_in_git_repo || return
  # TODO Adjust this to only list unstaged files!
  git restore --staged "$(git status | grep modified: | sed -e 's/ *.*: *//g' | tac | fzf -m)"
  git status
}
