function decimate() {
  ffmpeg -i "$1" -map 0:v -vf mpdecimate,setpts=N/FRAME_RATE/TB "${1%.*}"-decimated.mp4
}

function drive-by() {
  for file in *.png; do
    if convert "$file" -format "%[opaque]" info: | grep -q "True"; then
      convert "$file" -define png:include-chunk=none -quality 95 -depth 8 "$file"
    else
      convert "$file" "${file%.png}.jpg"
    fi
  done
}
