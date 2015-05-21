#!/bin/bash
PROXY='http:\/\/141.39.208.110:3128'

match='MAINTAINER'
insert='ENV HTTP_PROXY='$PROXY' http_proxy='$PROXY' HTTPS_PROXY='$PROXY' https_proxy='$PROXY
file='Dockerfile'

sed -i "/$match/a $insert" $file
