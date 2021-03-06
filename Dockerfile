FROM ruby:2.7-alpine
MAINTAINER Samuel Cochran <sj26@sj26.com>

ARG VERSION=0.7.1

RUN apk add --no-cache build-base sqlite-libs sqlite-dev && \
    gem install mailcatcher -v $VERSION && \
    apk del --rdepends --purge build-base sqlite-dev

EXPOSE 1025 1080

ENTRYPOINT ["mailcatcher", "--foreground"]
CMD ["--ip", "0.0.0.0"]
