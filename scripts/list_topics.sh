#!/usr/bin/env bash
set -euo pipefail
docker exec kafka kafka-topics.sh --bootstrap-server localhost:9092 --list
