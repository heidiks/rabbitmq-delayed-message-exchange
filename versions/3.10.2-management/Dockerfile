ARG PLUGIN_VERSION=3.10.2
ARG BASE_VERSION=3.10.2

FROM ubuntu:20.04 AS builder

ARG PLUGIN_VERSION

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y curl

RUN mkdir -p /plugins && \
	curl -fsSL \
	-o "/plugins/rabbitmq_delayed_message_exchange-${PLUGIN_VERSION}.ez" \
	https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/${PLUGIN_VERSION}/rabbitmq_delayed_message_exchange-${PLUGIN_VERSION}.ez

FROM rabbitmq:${BASE_VERSION}-management

ARG PLUGIN_VERSION

COPY --from=builder --chown=rabbitmq:rabbitmq \
	/plugins/rabbitmq_delayed_message_exchange-${PLUGIN_VERSION}.ez \
	$RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-${PLUGIN_VERSION}.ez

RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange

RUN rabbitmq-plugins enable --offline rabbitmq_consistent_hash_exchange
