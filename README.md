# Jaroslav Holaň - Java Demo app

This is an example of my experiments with some software technologies.

## Prerequisites

You need the following:
- Java 20
- Docker
- Maven

During the local setup you'll get docker image running for:
- MySQL DB (running on default port `3306`)

## Initial local setup
You can set up the project manually but who like manual setups? :-) 

If you want you can use the script `init.sh` to set up the project. Just run `sh init.sh` or `./init.sh` in the root folder of the project.


### Manual local setup
#### Use following command to create functional container with database:

You can use default password or update it with your own.
```bash
docker run --name holan-mysql -e MYSQL_ROOT_PASSWORD=holan -p 3306:3306 -d mysql:8.0.32
```

#### Create user and db in container. 

Go to the container shell:
```bash
docker exec -it holan-mysql mysql -uroot -pholan
```
Then run the following commands. You can use default password or update it with your own.
```bash
CREATE USER 'demouser'@'%' IDENTIFIED BY 'demouser';
CREATE DATABASE demojava;
GRANT ALL PRIVILEGES ON demojava.* TO 'demouser'@'%';
```

### Setup secrets

Before building the project, you need to set up the following:
1) Create a copy of the template `src/main/resources/application-secrets-sample.yml` and put it in the same folder with name `application-secrets.yml`
2) You can use default **username** and **password** or update it with your own in `application-secrets.yml` file.