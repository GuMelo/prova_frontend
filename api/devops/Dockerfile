# FROM python:3.9-alpine
FROM python:3.9-buster

WORKDIR /opt/coins

# RUN apk --update add curl net-tools tcpdump bind-tools jq bash redis && rm -rf /var/cache/apk/*

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl \
    bash \
    bc \
    unzip \
    postgresql-client \
    redis-tools \
    gcc && rm -rf /var/lib/apt/lists/*

COPY ./devops/run.sh .
COPY ./devops/coins.sh .
COPY ./devops/websocketd .

RUN chmod +x websocketd
RUN chmod +x run.sh
RUN chmod +x coins.sh

ENTRYPOINT [ "bash" , "run.sh" ]
