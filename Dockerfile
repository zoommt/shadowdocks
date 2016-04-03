FROM ubuntu:trusty

ENV SS_VERSION 1.1.4
ENV SS_PASSWORD dOcKeR
ENV SS_METHOD aes-256-cfb

RUN apt-get update \
 && apt-get install -y curl \
 && curl -O http://dl.chenyufei.info/shadowsocks/$SS_VERSION/shadowsocks-server-linux64-$SS_VERSION.gz \
 && gzip -d shadowsocks-server-linux64-$SS_VERSION.gz \
 && mv shadowsocks-server-linux64-$SS_VERSION /usr/local/bin/shadowsocks-server \
 && chmod +x /usr/local/bin/shadowsocks-server \
 && apt-get remove -y curl \
 && apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8388

CMD shadowsocks-server -p 8388 -k $SS_PASSWORD -m $SS_METHOD
