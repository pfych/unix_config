decimate () {
  ffmpeg -i $1 -map 0:v -vf mpdecimate,setpts=N/FRAME_RATE/TB "${1%.*}"-decimated.mp4
}
