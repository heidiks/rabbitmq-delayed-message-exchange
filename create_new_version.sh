#!/bin/bash

BASE_VERSION="${1}"
PLUGIN_VERSION="${2}"
UBUNTU_VERSION="${3}"
IS_LATEST="${4:-false}"

if [ -z "${BASE_VERSION}" ]; then
  read -p "1 - Enter the RabbitMQ image version(without management suffix): " BASE_VERSION
fi

if [ -z "${PLUGIN_VERSION}" ]; then
  read -p "2 - Enter the Plugin version: " PLUGIN_VERSION
fi

if [ -z "${UBUNTU_VERSION}" ]; then
  read -p "3 - Enter the Ubuntu version (press enter to default 22.04): " UBUNTU_VERSION
  if [ -z "${UBUNTU_VERSION}" ]; then
    UBUNTU_VERSION="22.04"
  fi
fi

read -p "4 - latest version? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  IS_LATEST=true
fi

if [ -z "${BASE_VERSION}" ] || [ -z "${PLUGIN_VERSION}" ] || [ -z "${UBUNTU_VERSION}" ]; then
  echo "Missing variables"
  exit 1
fi
echo
echo "- RabbitMQ version: ${BASE_VERSION}-management"
echo "- Plugin version: ${PLUGIN_VERSION}"
echo "- Ubuntu version: ${UBUNTU_VERSION}"
echo "- Is latest version: ${IS_LATEST}"
echo
read -p "Do you want to continue? (y/n): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Aborted"
  exit 1
fi

if [ ! -d versions/${BASE_VERSION}-management ]; then
  mkdir -p versions/${BASE_VERSION}-management;
fi


cat > versions/${BASE_VERSION}-management/Dockerfile <<EOF
ARG PLUGIN_VERSION=${PLUGIN_VERSION}
ARG BASE_VERSION=${BASE_VERSION}

FROM ubuntu:${UBUNTU_VERSION} AS builder

ARG PLUGIN_VERSION

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y curl

RUN mkdir -p /plugins && \\
	curl -fsSL \\
	-o "/plugins/rabbitmq_delayed_message_exchange-\${PLUGIN_VERSION}.ez" \\
	https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v\${PLUGIN_VERSION}/rabbitmq_delayed_message_exchange-\${PLUGIN_VERSION}.ez

FROM rabbitmq:\${BASE_VERSION}-management

ARG PLUGIN_VERSION

COPY --from=builder --chown=rabbitmq:rabbitmq \\
	/plugins/rabbitmq_delayed_message_exchange-\${PLUGIN_VERSION}.ez \\
	\$RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-\${PLUGIN_VERSION}.ez

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange

RUN rabbitmq-plugins enable rabbitmq_consistent_hash_exchange
EOF

echo "* Dockerfile created at versions/${BASE_VERSION}-management/Dockerfile"

if [ "${IS_LATEST}" == true ]; then
  cp versions/${BASE_VERSION}-management/Dockerfile versions/latest/Dockerfile
  echo "* Latest Dockerfile updated"
fi