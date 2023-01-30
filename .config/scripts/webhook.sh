REQUESTED_USER=''
NAME='Webhook'
PIC=''
MSG=''
ENDPOINT='_'
FILE='_'

getUser() {
  sed -nE "/^\[$REQUESTED_USER\]$/{:l n;/^(\[.*\])?$/q;p;bl}" ~/.config/webhook > /tmp/webhook_config.sh;
  chmod +x /tmp/webhook_config.sh
  . /tmp/webhook_config.sh
  rm /tmp/webhook_config.sh
}

printUsage() {
  echo ""
  echo "Discord Webhook Wrapper"
  echo "-c Requested premade config to use"
  echo "-n Username to use"
  echo "-p Picture to use"
  echo "-m Message to send"
  echo "-e Endpoint to hit"
  echo ""
}

while getopts 'c:n:p:m:e:' flag; do
  case "${flag}" in
    c)  REQUESTED_USER="${OPTARG}"; getUser ;;
    n)  NAME="${OPTARG}" ;;
    p)  PIC="${OPTARG}" ;;
    m)  MSG="${OPTARG}" ;;
    e)  ENDPOINT="${OPTARG}" ;;
    f)  FILE="${OPTARG}" ;;
    *)  printUsage ;;
  esac
done

if [[ "$ENDPOINT" == "_" ]]; then
  echo "Please provide an endpoint url with -e"
  exit 1
else
  if [[ "$FILE" == "_" ]]; then
    curl -i \
      -H "Accept: multipart/form-data" \
      -H "Content-Type: multipart/form-data" \
      -F "payload_json={\"content\": \"$MSG\", \"username\": \"$NAME\", \"avatar_url\": \"$PIC\"}" \
      "$ENDPOINT" > /dev/null 2>&1;
  else
    curl -i \
      -F "file1=@${FILE}" \
      -H "Accept: multipart/form-data" \
      -H "Content-Type: multipart/form-data" \
      -F "payload_json={\"content\": \"$MSG\", \"username\": \"$NAME\", \"avatar_url\": \"$PIC\"}" \
      "$ENDPOINT" > /dev/null 2>&1;
  fi
fi
