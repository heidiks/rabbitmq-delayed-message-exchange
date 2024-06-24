RabbitMQ with management and a compatible version of the delayed message exchange plugin.

## Versions
- [latest](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/latest/Dockerfile)
- 3.13.x
  - [3.13.0-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.13.0-management/Dockerfile)
- 3.12.x
  - [3.12.10-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.12.10-management/Dockerfile)
  - [3.12.2-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.12.2-management/Dockerfile)
- 3.11.x:
  - [3.11.28-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.11.28-management/Dockerfile)
- 3.10.x:
    - [3.10.2-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.10.2-management/Dockerfile)
- 3.9.x:
    - [3.9.13-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.9.13-management/Dockerfile)
    - [3.9.11-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.9.11-management/Dockerfile)
    - [3.9.7-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.9.7-management/Dockerfile)
    - [3.9.0-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.9.0-management/Dockerfile)
- 3.8.x:
    - [3.8.27-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.8.27-management/Dockerfile)
    - [3.8.9-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.8.9-management/Dockerfile)
    - [3.8.8-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.8.8-management/Dockerfile)
    - [3.8.5-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.8.5-management/Dockerfile)
    - [3.8.3-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.8.3-management/Dockerfile)
- 3.7.x:
    - [3.7.23-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.7.23-management/Dockerfile)
    - [3.7.17-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.7.17-management/Dockerfile)
    - [3.7.14-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.7.14-management/Dockerfile)
    - [3.7.11-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.7.11-management/Dockerfile)
    - [3.7.10-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.7.10-management/Dockerfile)
    - [3.7.8-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.7.8-management/Dockerfile)
    - [3.7.7-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.7.7-management/Dockerfile)
    - [3.7-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.7-management/Dockerfile)
- 3.6.x:
    - [3.6.16-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.6.16-management/Dockerfile)
    - [3.6-management](https://github.com/heidiks/rabbitmq-delayed-message-exchange/blob/master/versions/3.6-management/Dockerfile)

## Running
#### Image

    docker run heidiks/rabbitmq-delayed-message-exchange:latest


#### Docker compose sample:
```YAML
version: '3.3'

services:
  rabbit:
    image: heidiks/rabbitmq-delayed-message-exchange:latest
    environment:
      - RABBITMQ_DEFAULT_USER=admin
      - RABBITMQ_DEFAULT_PASS=password
    ports:
      - "5672:5672"
      - "15672:15672"
```

## Environment
The environment variables are the same as the [official image](https://hub.docker.com/_/rabbitmq/)
- Sample
    - RABBITMQ_DEFAULT_USER=admin
    - RABBITMQ_DEFAULT_PASS=password
