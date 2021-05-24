FROM postgres:10-alpine

RUN apk --update add curl net-tools tcpdump bind-tools jq && rm -rf /var/cache/apk/*

COPY devops/sql/dump.sql /docker-entrypoint-initdb.d/