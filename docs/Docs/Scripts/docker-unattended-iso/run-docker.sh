#!/bin/bash

rm -rf artifacts
mkdir -p artifacts
docker system prune -f
docker buildx build --network host --target export --output type=local,dest=./artifacts .
docker system prune -f
