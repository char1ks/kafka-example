#!/usr/bin/env bash
set -euo pipefail
TOPIC=${1:-order_topic}
MODE=${2:-latest}
EXTRA=${3:-}

if [[ "$MODE" == "earliest" ]]; then
  docker exec -it kafka kafka-console-consumer \
    --bootstrap-server localhost:9092 \
    --topic "$TOPIC" \
    --from-beginning \
    --consumer-property auto.offset.reset=earliest \
    $EXTRA
else
  docker exec -it kafka kafka-console-consumer \
    --bootstrap-server localhost:9092 \
    --topic "$TOPIC" \
    $EXTRA
fi
