#!/bin/bash

echo "enter the baidupcs-web ver.:";
read ver 


docker build  \
 -t emile/baidupcs:${ver}  \
 --build-arg BaiduPCSGo_VER=${ver}  \
 --force-rm   \
 -f Dockerfile .
