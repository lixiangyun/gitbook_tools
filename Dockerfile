FROM node:6-slim

MAINTAINER linimbus <linimbus@126.com>

ARG VERSION=3.2.0

LABEL version=$VERSION

RUN npm install gitbook-cli -g

# dockerhub execution failed
#RUN npm install svgexport -g

RUN gitbook fetch ${VERSION}
RUN npm cache clear
RUN rm -rf /tmp/*

RUN apt-get update && apt-get install -y calibre

# clean up useless packages
RUN apt-get clean && apt-get autoclean 

WORKDIR /srv/gitbook
VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729
CMD /usr/local/bin/gitbook serve
