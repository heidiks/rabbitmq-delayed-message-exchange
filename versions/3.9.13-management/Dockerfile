FROM rabbitmq:3.9.13-management

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y curl

RUN curl -fsSL \
	-o "$RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.9.0.ez" \
	https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.9.0/rabbitmq_delayed_message_exchange-3.9.0.ez

RUN chown rabbitmq:rabbitmq $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.9.0.ez

RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange

RUN rabbitmq-plugins enable --offline rabbitmq_consistent_hash_exchange
