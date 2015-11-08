FROM ubuntu:trusty

RUN apt-get -qq update \
    && apt-get install -q -y \
    python-pip \
    python-m2crypto \
    && apt-get clean \
    && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    && pip install shadowsocks

EXPOSE 8388

CMD ssserver -k $SS_PASSWORD
