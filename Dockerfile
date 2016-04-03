FROM alpine:latest

ENV SS_VERSION 1.1.4
ENV SS_PASSWORD dOcKeR
ENV SS_METHOD aes-256-cfb

RUN apk update \
 && apk add --no-cache curl gzip \
 && curl -O http://dl.chenyufei.info/shadowsocks/$SS_VERSION/shadowsocks-server-linux64-$SS_VERSION.gz \
 && gzip -d shadowsocks-server-linux64-$SS_VERSION.gz \
 && mv shadowsocks-server-linux64-$SS_VERSION /usr/local/bin/shadowsocks-server \
 && chmod +x /usr/local/bin/shadowsocks-server \
 && apk del curl gzip

EXPOSE 8388

CMD shadowsocks-server -p 8388 -k $SS_PASSWORD -m $SS_METHOD
