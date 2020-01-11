FROM alpine

ARG BaiduPCSGo_VER
ARG  S6_VER=1.22.1.0

COPY  root /

RUN apk add --no-cache bash  ca-certificates  \
&&  rm -rf /var/cache/apk/*  \
&&  addgroup -g 1000 -S emile  \
&&  adduser emile -u 1000 -D -s /bin/bash -G emile  \
&&  wget  https://github.com/liuzhuoling2011/baidupcs-web/releases/download/${BaiduPCSGo_VER}/BaiduPCS-Go-${BaiduPCSGo_VER}-linux-amd64.zip \
#&&  wget --no-check-certificate http://qiniu.zoranjojo.top/BaiduPCS-Go-${BaiduPCSGo_VER}-linux-amd64.zip  \
&&  unzip BaiduPCS-Go-${BaiduPCSGo_VER}-linux-amd64.zip \
&&  mv BaiduPCS-Go-${BaiduPCSGo_VER}-linux-amd64/BaiduPCS-Go /usr/local/bin/BaiduPCS-Go \
&&  rm -rf BaiduPCS-Go-${BaiduPCSGo_VER}-linux-amd64*  \
&&  chmod a+x /usr/local/bin/BaiduPCS-Go  \
&&  wget   https://github.com/just-containers/s6-overlay/releases/download/v${S6_VER}/s6-overlay-amd64.tar.gz  \
&&  tar xvzf s6-overlay-amd64.tar.gz  \
&&  rm s6-overlay-amd64.tar.gz 

VOLUME /root/Downloads /config
EXPOSE 5299
ENTRYPOINT [ "/init" ]


