#!/bin/bash
NAME="postfix"

docker stop $NAME
docker rm $NAME
docker ps

