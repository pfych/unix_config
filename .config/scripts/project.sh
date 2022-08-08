#!/bin/sh

API_PATH_FROM_ROOT="api/"
APP_PATH_FROM_ROOT="clients/packages/web/app/"

PROJECT_PATHS=(
  "~/Developer/Devika/Projects/z-recruitment/"
)

function openProject() {
  SELECTED=`printf "%s\n" "${PROJECT_PATHS[@]}" | fzf`

  tmux new-session \; \
    send-keys "cd $SELECTED$API_PATH_FROM_ROOT && yarn start" C-m \; \
    split-window -v \; \
    send-keys "cd $SELECTED$APP_PATH_FROM_ROOT" C-m \;
}
