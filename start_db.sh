#!/usr/bin/env bash
docker run -p 5432:5432 -e POSTGRES_USER=chopin -e POSTGRES_PASSWORD=chopin -d postgres
