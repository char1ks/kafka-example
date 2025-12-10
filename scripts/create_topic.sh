#!/usr/bin/env bash
set -euo pipefail
TOPIC=${1:-order_topic}
PARTITIONS=${2:-1}
REPLICATION=${3:-1}
docker exec kafka kafka-topics \
  --bootstrap-server localhost:9092 \
  --create \
  --topic "$TOPIC" \
  --partitions "$PARTITIONS" \
  --replication-factor "$REPLICATION"
echo "Topic '$TOPIC' created"
