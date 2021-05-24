#!/bin/bash

./websocketd --help

ls -la

echo "setting default value"

echo "redis: $REDIS_SERVER"

redis-cli -h $REDIS_SERVER SET jaspion_coin_value 1.59 #coin value
redis-cli -h $REDIS_SERVER SET jiban_coin_value 0.99   #coin value
redis-cli -h $REDIS_SERVER SET jiraya_coin_value 1.99  #coin value

./websocketd \
    --passenv=REDIS_SERVER \
    --port=5000 bash /opt/coins/coins.sh
