#!/bin/sh
set -e

mkdir -p /data/images

if [ ! -f /data/images/sample.jpg ]; then
  echo "Seeding sample.jpg into mounted volume..."
  cp /seed-images/sample.jpg /data/images/sample.jpg
fi

exec java -Dcantaloupe.config=/app/cantaloupe.properties -jar /app/cantaloupe.jar