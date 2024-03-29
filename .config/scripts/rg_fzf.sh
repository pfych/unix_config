#!/bin/bash

function rgfzf() {
  FZF_SELECTION=$(rg -g '!*.{svg,js}' . | fzf)
  FILE_NAME=$(echo "$FZF_SELECTION" | cut -d':' -f1)
  CONTENT=$(echo "$FZF_SELECTION" | cut -d':' -f2-)
  ESCAPED=$(echo "$CONTENT" | sed -e 's,/,\\/,g')

  vim "$FILE_NAME" -c "/$ESCAPED"
}
