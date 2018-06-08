FROM ubuntu:latest

RUN apt-get update && apt-get install -y build-essential libssl-dev libpcre3 libpcre3-dev zlib1g zlib1g-dev
RUN apt-get install -y wget

RUN mkdir /build
WORKDIR /build
ADD build.sh /build/build.sh
RUN /build/build.sh

RUN rm -rf /etc/nginx/conf.d/* /etc/nginx/sites-enabled/*
ADD origin.conf /etc/nginx/conf.d/
ADD steam.conf /etc/nginx/conf.d/
ADD blizzard.conf /etc/nginx/conf.d/
ADD league.conf /etc/nginx/conf.d/
ADD wargaming.conf /etc/nginx/conf.d/
ADD sony.conf /etc/nginx/conf.d/
ADD microsoft.conf /etc/nginx/conf.d/
ADD hirez.conf /etc/nginx/conf.d/
ADD epic.conf /etc/nginx/conf.d/
ADD uplay.conf /etc/nginx/conf.d/

RUN mkdir -p /var/lib/nginx/body 
RUN mkdir -p /var/lib/nginx/fastcgi 
RUN mkdir -p /cache/origin /cache/steam /cache/blizzard /cache/league /cache/wargaming /cache/sony /cache/microsoft /cache/hirez /cache/epic /cache/uplay

ADD nginx.conf /etc/nginx/nginx.conf

CMD nginx -g "daemon off;" -c /etc/nginx/nginx.conf

