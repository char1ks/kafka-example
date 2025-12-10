#!/usr/bin/env bash
set -euo pipefail
docker compose down -v
echo "Kafka stopped and volumes removed"
