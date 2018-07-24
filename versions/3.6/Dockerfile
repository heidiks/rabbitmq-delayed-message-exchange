FROM rabbitmq:3.6-management

RUN apt-get update

RUN apt-get install -y curl

RUN curl https://dl.bintray.com/rabbitmq/community-plugins/3.6.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20171215-3.6.x.zip > $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-20171215-3.6.x.zip

RUN apt-get install -y unzip

RUN unzip $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-20171215-3.6.x.zip -d $RABBITMQ_HOME/plugins

RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange

RUN rabbitmq-plugins enable --offline rabbitmq_consistent_hash_exchange
