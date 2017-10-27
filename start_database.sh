#/usr/bin/env bash
docker run --name backend_postgres -p 5432:5432 -e POSTGRES_USER=backend -e POSTGRES_PASSWORD=backend -d postgres:9-alpine
