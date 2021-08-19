function vent () {
  echo "I hear you";
  echo "$*" > /dev/null;
}
