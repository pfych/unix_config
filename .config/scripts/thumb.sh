#!/bin/bash

function thumb() {
  UUID=$(uuidgen)
  GRID_X=2
  GRID_Y=4
  TMP_FILE_LOCATION="/tmp/tmp_chapters_out_$UUID.mp4"

  echo "Removing blank frames..."
  
  ffmpeg \
    -hide_banner \
    -i "$1" \
    -an -r 0.25 \
    -vf blackframe=0,metadata=select:key=lavfi.blackframe.pblack:value=15:function=less \
    "$TMP_FILE_LOCATION"

  echo "Getting frame rate..."
  # Get frame rate
  FRAMES=$(ffprobe \
    -loglevel quiet \
    -select_streams v:0 \
    -count_packets \
    -show_entries stream=nb_read_packets \
    -of csv=p=0 "$TMP_FILE_LOCATION"
  )

  echo "Total frames: $FRAMES"

  GRID_TOTAL=$((GRID_X*GRID_Y))
  SPLICE=$(((FRAMES + GRID_TOTAL - 1) / GRID_TOTAL))
  echo "Splicing every: $SPLICE"

  echo "Generating thumbnail grid..."
  # Generate for frame rate
  ffmpeg \
    -hide_banner \
    -loglevel quiet \
    -i "$TMP_FILE_LOCATION" \
    -vf "select=not(mod(n\,$SPLICE)),scale=800:-1,tile=$GRID_X\x$GRID_Y" \
    -vsync 0 \
    chapters.jpg

  rm "$TMP_FILE_LOCATION"
}


