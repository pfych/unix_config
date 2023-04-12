#!/bin/bash

function awsconfig {
  AWS_PROFILE=$(cat ~/.aws/credentials \
    | grep "\[" \
    | fzf \
    | tr -d "[" \
    | tr -d "]" \
    | xargs
  )

  clear

  vim /tmp/raw_keys.tmp

  cat /tmp/raw_keys.tmp | grep -v "\[.*\]$" > /tmp/keys.tmp

  export $(xargs < /tmp/keys.tmp)

  aws configure set aws_access_key_id "${aws_access_key_id}" --profile "$AWS_PROFILE"
  aws configure set aws_secret_access_key "${aws_secret_access_key}" --profile "$AWS_PROFILE"
  aws configure set aws_session_token "${aws_session_token}" --profile "$AWS_PROFILE"

  echo "Testing AWS Keys..."
  IAM_RESULT=$(aws sts get-caller-identity --query "Account" --output text --profile "$AWS_PROFILE")
  
  if [ "$IAM_RESULT" ]; then
    echo "Credentials work!"
  else
    echo "AWS Keys did not work!"
  fi

  rm /tmp/raw_keys.tmp /tmp/keys.tmp
}

