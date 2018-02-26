# See https://wiki.debian.org/Docker
FROM debian:unstable

RUN echo 'Acquire::http::proxy "http://172.17.0.1:3142/";' | tee -a /etc/apt/apt.conf.d/02proxy
RUN cat /etc/apt/apt.conf.d/02proxy

RUN apt update
RUN apt -y upgrade

RUN apt install -y vim lv

RUN apt install -y locales
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8

