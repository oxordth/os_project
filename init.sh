#!/bin/bash

echo "Создание паттерна индекса"
curl -X POST "http://dashboards:5601/api/saved_objects/index-pattern/web-logs" \
  -H 'osd-xsrf: true' \
  -H 'Content-Type: application/json' \
  -d '{ "attributes": { "title": "web-logs-*", "timeFieldName": "@timestamp" }}'

echo "Импрот дэшбордов"
curl -X POST "http://dashboards:5601/api/saved_objects/_import" \
  -H 'osd-xsrf: true' \
  -F file=@/dashboards.ndjson
echo "Настройка завершена"
