#!/usr/bin/env bash
set -euo pipefail
TOPIC=${1:-order_topic}
FILE=${2:-}

if [[ -z "$FILE" ]]; then
  echo '{"orderId":1,"userId":101,"items": [{"sku":"ABC-1","qty":2}],"total": 1999,"currency":"RUB"}' | \
  docker exec -i kafka kafka-console-producer --bootstrap-server localhost:9092 --topic "$TOPIC"
  echo "Sent sample message to '$TOPIC'"
else
  if [[ ! -f "$FILE" ]]; then
    echo "File not found: $FILE" >&2
    exit 1
  fi
  docker exec -i kafka kafka-console-producer --bootstrap-server localhost:9092 --topic "$TOPIC" < "$FILE"
  echo "Sent contents of '$FILE' to '$TOPIC'"
fi
