#!/bin/bash

echo "================================================="
cat dotenv.env
echo "================================================="

dotenvx run -f dotenv.env -- \
    docker compose build

dotenvx run -f dotenv.env -- \
  docker compose up

sed -i '' 's/BEFORE/--UPDATED AFTER--/' dotenv.env

echo "================================================="
cat dotenv.env
echo "================================================="

dotenvx run -f dotenv.env -- \
  docker compose up
