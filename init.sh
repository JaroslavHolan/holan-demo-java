#!/bin/bash

# Create Docker container with Postgres database
docker run --name holandb -e POSTGRES_PASSWORD=holandb -p 5432:5432 -d postgres:15.2

# Wait 10 seconds. If it is not enough, wait until the container is ready and then run the script again.
echo "Waiting 10 seconds for container to be ready."
sleep 10
echo "Container is ready"

# Create user and db in container.
# Note: If you want change username and password to your own values.
docker exec holandb createuser -U postgres demouser
docker exec holandb createdb -U postgres demojava
docker exec holandb psql -U postgres -c "alter user demouser with encrypted password 'demouser'"
docker exec holandb psql -U postgres -c "grant all privileges on database demojava to demouser"

# Setup secrets
cp src/main/resources/application-secrets-sample.yml src/main/resources/application-secrets.yml
