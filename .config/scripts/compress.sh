decimate() {
  ffmpeg -i "$1" -map 0:v -vf mpdecimate,setpts=N/FRAME_RATE/TB "${1%.*}"-decimated.mp4
}

drive-by() {
  for file in *.png; do
    if convert "$file" -channel a -separate -format "%[fx:100*mean]%" info: | grep -qE "(99\.|100)"; then
      convert "$file" "${file%.png}.jpg"
      echo "Created jpg"
    else
      convert "$file" -define png:include-chunk=none -quality 95 -depth 8 "$file"
      echo "Compressed png"
    fi
  done
}
