#!/bin/bash

# TODO Suport input like "tomorrow", "today" etc
function scratch () {
  requestedDate=$(date +"%d-%m-%y")
  vim ~/Documents/Scratchpad/$requestedDate.md 
}

