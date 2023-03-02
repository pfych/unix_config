decimate() {
  ffmpeg -i "$1" -map 0:v -vf mpdecimate,setpts=N/FRAME_RATE/TB "${1%.*}"-decimated.mp4
}

drive-by() {
  for file in *.png; do
    if convert "$file" -channel a -separate -format "%[fx:100*mean]%" info: | grep -qE "(99\.|100)"; then
      convert "$file" "${file%.png}.jpg"
      convert "$file" "${file%.png}.webp"
      echo "Created jpg & webp"
    else
      convert "$file" -define png:include-chunk=none -quality 95 -depth 8 "$file"
      convert "$file" "${file%.png}.webp"
      echo "Compressed png & created webp"
    fi
  done
}

site-prep() {
  mkdir -p md/;
  mkdir -p sm/;

  convert "$1" \
    -strip \
    -interlace Plane \
    -gaussian-blur 0.05 \
    -quality 85% \
    -resize 720 "md/${1%.*}.jpg"

  convert "$1" \
    -strip \
    -scale 10% \
    -blur 0x2.5 \
    -resize 1000% \
    -resize 180 "sm/${1%.*}.jpg"

  echo "$1 is prepped"
}
