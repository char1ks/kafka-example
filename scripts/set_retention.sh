#!/usr/bin/env bash
set -euo pipefail
TOPIC=${1:-order_topic}
MS=${2:-60000}
docker exec kafka kafka-configs \
  --bootstrap-server localhost:9092 \
  --alter \
  --topic "$TOPIC" \
  --add-config retention.ms="$MS"
echo "Topic '$TOPIC' retention.ms set to $MS"
