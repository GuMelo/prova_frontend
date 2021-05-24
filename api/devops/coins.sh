#!/bin/bash

while true; do
    RESULT_j1=$(echo "$((1 + $RANDOM))/$((1 + $RANDOM))" | bc -l | awk '{printf "%f", $0}')
    RESULT_j2=$(echo "$((1 + $RANDOM))/$((1 + $RANDOM))" | bc -l | awk '{printf "%f", $0}')
    RESULT_j3=$(echo "$((1 + $RANDOM))/$((1 + $RANDOM))" | bc -l | awk '{printf "%f", $0}')

    redis-cli -h $REDIS_SERVER SET jaspion_coin_value "$RESULT_j1"
    redis-cli -h $REDIS_SERVER SET jiban_coin_value "$RESULT_j2"
    redis-cli -h $REDIS_SERVER SET jiraya_coin_value "$RESULT_j3"

    sleep 0.5
    echo "{\"jaspion_coin_value\": $(redis-cli -h $REDIS_SERVER GET jaspion_coin_value)}"
    sleep 0.5
    echo "{\"jiban_coin_value\": $(redis-cli -h $REDIS_SERVER GET jiban_coin_value)}"
    sleep 0.5
    echo "{\"jiraya_coin_value\": $(redis-cli -h $REDIS_SERVER GET jiraya_coin_value)}"
done
