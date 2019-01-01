#!/bin/bash
IMAGE="alangtw/postfix-smtp:trusty"
NAME="postfix"

docker run -d --name=$NAME \
 -p 25:25 \
 -p 587:587 \
 -v ${PWD}/data/certs:/etc/postfix/certs \
 -v ${PWD}/data/domainkeys:/etc/opendkim/domainkeys \
 -e maildomain=mydomain.com -e smtp_user=alang@mydomain.com:thispassword \
 $IMAGE

docker ps

