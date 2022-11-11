#!/bin/bash

function thumb() {
  GRID=5

  echo "Getting frame rate..."
  # Get frame rate
  FRAMES=$(ffprobe \
    -loglevel quiet \
    -select_streams v:0 \
    -count_packets \
    -show_entries stream=nb_read_packets \
    -of csv=p=0 "$1"
  )

  echo "Total frames: $FRAMES"

  GRID_TOTAL=$((GRID*GRID))
  SPLICE=$(((FRAMES + GRID_TOTAL - 1) / GRID_TOTAL))

  echo "Splicing every: $SPLICE"

  echo "Generating thumbnail grid..."
  # Generate for frame rate
  ffmpeg \
    -hide_banner \
    -loglevel quiet \
    -i "$1" \
    -vf "select=not(mod(n\,$SPLICE)),scale=400:-1,tile=$GRID\x$GRID" \
    -vsync 0 \
    chapters.jpg
}


