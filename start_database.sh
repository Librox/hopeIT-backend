#/usr/bin/env bash
docker run --name elpis_postgres -p 5432:5432 -e POSTGRES_USER=elpis -e POSTGRES_PASSWORD=elpis -d postgres:9.6-alpine
