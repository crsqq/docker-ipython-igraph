#!/bin/bash

match='MAINTAINER'
insert='ENV HTTP_PROXY='$PROXY' http_proxy='$PROXY' HTTPS_PROXY='$PROXY' https_proxy='$PROXY
file='Dockerfile'

sed -i "/$match/a $insert" $file
