FROM node:6-slim

MAINTAINER linimbus <linimbus@126.com>

ARG VERSION=3.2.0

LABEL version=$VERSION

RUN npm install --global gitbook-cli
RUN gitbook fetch ${VERSION}
RUN npm cache clear
RUN rm -rf /tmp/*

RUN apt-get update && apt-get install -y calibre

#RUN apt-get update && apt-get install -y xdg-utils xz-utils python wget
#RUN wget --no-check-certificate -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin

WORKDIR /srv/gitbook
VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729
CMD /usr/local/bin/gitbook serve
