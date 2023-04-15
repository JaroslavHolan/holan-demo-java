#!/bin/bash

# Create Docker container with MySQL database
docker run --name holan-mysql -e MYSQL_ROOT_PASSWORD=holan -p 3306:3306 -d mysql:8.0.32

# Wait 10 seconds. If it is not enough, wait until the container is ready and then run the script again.
echo "Waiting 10 seconds for container to be ready."
sleep 10
echo "Container is ready"

# Create user and db in container.
# Note: If you want change username and password to your own values.
docker exec -it holan-mysql mysql -uroot -pholan -e "CREATE USER 'demouser'@'%' IDENTIFIED BY 'demouser'; \
CREATE DATABASE demojava; \
GRANT ALL PRIVILEGES ON demojava.* TO 'demouser'@'%';"

# Setup secrets
cp src/main/resources/application-secrets-sample.yml src/main/resources/application-secrets.yml
