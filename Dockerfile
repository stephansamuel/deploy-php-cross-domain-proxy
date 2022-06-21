FROM composer:2.3

RUN set -eux; apk update \
    && apk add --no-cache curl jq \
    && rm -rf /var/cache/apk/*

WORKDIR /app

RUN chmod a+x /app/deploy.containerized

ENTRYPOINT [ "deploy.containerized" ]
