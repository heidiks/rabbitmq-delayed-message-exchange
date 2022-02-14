ARG VERSION=3.9.0
ARG BASE_VERSION=3.9.13

FROM ubuntu:20.04 AS builder

ARG VERSION

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y curl

RUN mkdir -p /plugins && \
	curl -fsSL \
	-o "/plugins/rabbitmq_delayed_message_exchange-${VERSION}.ez" \
	https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/${VERSION}/rabbitmq_delayed_message_exchange-${VERSION}.ez

FROM rabbitmq:${BASE_VERSION}-management

ARG VERSION

COPY --from=builder --chown=rabbitmq:rabbitmq \
	/plugins/rabbitmq_delayed_message_exchange-${VERSION}.ez \
	$RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-${VERSION}.ez

RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange

RUN rabbitmq-plugins enable --offline rabbitmq_consistent_hash_exchange
