ARG VERSION=3.9.0
ARG BASE_VERSION=${VERSION}

FROM rabbitmq:${BASE_VERSION}-management

ARG VERSION

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y curl

RUN curl -fsSL \
	-o "$RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-${VERSION}.ez" \
	https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/${VERSION}/rabbitmq_delayed_message_exchange-${VERSION}.ez

RUN chown rabbitmq:rabbitmq $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-${VERSION}.ez

RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange

RUN rabbitmq-plugins enable --offline rabbitmq_consistent_hash_exchange
