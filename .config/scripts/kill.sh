kill-port() {
  sudo kill -9 $(lsof -t -i:"$1")
}

kill-all() {
  sudo kill -9 $(pgrep "$1")
}
