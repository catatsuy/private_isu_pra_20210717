#!/bin/bash

set -x

echo "start deploy ${USER}"
GOOS=linux GOARCH=amd64 go build -o iscogram_linux
for server in isu01; do
  ssh -t $server "sudo systemctl stop isu-go"
  scp ./iscogram_linux $server:/home/isucon/private_isu/webapp/golang/app
#   rsync -vau ../sql/ $server:/home/isucon/isucari/webapp/sql/
  ssh -t $server "sudo systemctl start isu-go"
done

echo "finish deploy ${USER}"