FROM debian:jessie

ENV HTTP_PROXY http://ntes.proxy.corp.sopra:8080
ENV HTTPS_PROXY $HTTP_PROXY
ENV http_proxy $HTTP_PROXY
ENV https_proxy $HTTP_PROXY

ENV PANDOC_VERSION 1.15.2

WORKDIR /pandoc

RUN apt-get -y update && apt-get -y install \
  wget

RUN wget https://github.com/jgm/pandoc/releases/download/$PANDOC_VERSION/pandoc-$PANDOC_VERSION-1-amd64.deb \
  && dpkg -i pandoc-$PANDOC_VERSION-1-amd64.deb

VOLUME ["/output"]

COPY ../../build.sh /pandoc/
COPY ../../slides.md /pandoc/
COPY entrypoint.sh /usr/bin/

CMD ["/usr/bin/entrypoint.sh"]
