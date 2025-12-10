#!/usr/bin/env bash
set -euo pipefail
docker compose up -d
echo "Kafka started (container: kafka). Broker: localhost:9092"
