# Jaroslav Holaň - Java Demo app

This is example of my experiments with some software technologies.

## Prerequisites

You need the following:
- Java 20
- Docker
- Maven

During the local setup you'll get docker image running for:
- Postgres DB (running on default port `5432`)

## Initial local setup
You can set up the project manually but who like manual setups? :-) 

If you want you can use the script `init.sh` to set up the project. Just run `sh init.sh` or `./init.sh` in the root folder of the project.


### Manual local setup
#### Use following command to create functional container with database:

You can use default password or update it with your own.
```
docker run --name holandb -e POSTGRES_PASSWORD=holandb -p 5432:5432 -d postgres:15.2
```

#### Create user and db in container. 

Go to the container shell:
```
docker exec -it holandb bash
```
Then run the following commands. You can use default password or update it with your own.
```
createuser -U postgres demouser
createdb -U postgres demojava
psql -U postgres -c "alter user demouser with encrypted password 'demouser'"
psql -U postgres -c "grant all privileges on database demojava to demouser"
```

### Setup secrets

Before building the project, you need to set up the following:
1) Create a copy of the template `src/main/resources/application-secrets-sample.yml` and put it in the same folder with name `application-secrets.yml`
2) You can use default **username** and **password** or update it with your own in `application-secrets.yml` file.