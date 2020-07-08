FROM rabbitmq:3.8.3-management

RUN apt-get update

RUN apt-get install -y curl

RUN curl https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v3.8.0/rabbitmq_delayed_message_exchange-3.8.0.ez > $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.8.0.ez

RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange

RUN rabbitmq-plugins enable --offline rabbitmq_consistent_hash_exchange
