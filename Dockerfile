FROM composer:2.3

RUN apk update \
    && apk add --no-cache curl jq \
    && rm -rf /var/cache/apk/*

WORKDIR /app
