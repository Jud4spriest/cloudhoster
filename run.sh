#!/bin/bash

chmod +x cloudhoster/scripts/start.sh
export $(grep -v '^#' .env | xargs)
envsubst < database/init.sql.template > database/init.sql
docker-compose up --build -d