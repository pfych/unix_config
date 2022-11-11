#Encrypt Files
function encrypt {
  FILE_EXTENSION=$(echo $1 | cut -f 2,3 -d '.')
  FILE_NAME=$(echo "$1" | cut -f 1 -d '.')

  openssl enc -aes-256-cbc -salt -in "$*" -out "$FILE_NAME".enc
  echo "$GREEN_TEXT\nSend the follow command via Slack alongside the file:$DEFAULT_TEXT\n\`openssl enc -d -aes-256-cbc -in ~/Downloads/$FILE_NAME.enc >> $FILE_NAME.$FILE_EXTENSION"
}

# Create a Salted UUID
function salted-uuid {
  # Convert input into base64 string
  INPUT_AS_BASE64=$(echo -n "$1" | openssl dgst -binary -sha256 | openssl base64)
  BASE64_SANITIZED=$(echo -n "$INPUT_AS_BASE64" | sed 's/[=\/+-]//g')

  # Add Delimiters to the string
  BASE_WITH_DELIM=$(echo -n "$BASE64_SANITIZED" | sed -E 's/./&-/32;s/./&-/20;s/./&-/16;s/./&-/12;s/./&-/8')

  # Return with cruft removed
  echo "$BASE_WITH_DELIM" | cut -f1,2,3,4,5 -d"-" | tr '[a-z]' '[A-Z]'
}
