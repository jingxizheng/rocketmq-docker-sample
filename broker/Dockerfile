ARG BROKER_IP1
ARG LISTEN_PORT

# Start from a base image.
FROM apache/incubator-rocketmq-base:4.0.0-incubating

RUN echo $BROKER_IP1
RUN echo $LISTEN_PORT

# Rocketmq version
ENV ROCKETMQ_VERSION 4.0.0-incubating

# Rocketmq home
ENV ROCKETMQ_HOME  /opt/rocketmq-${ROCKETMQ_VERSION}

WORKDIR  ${ROCKETMQ_HOME}

RUN mkdir -p \
		/opt/logs \
	    /opt/store


RUN chmod +x bin/mqbroker

RUN echo "brokerIP1=$BROKER_IP1" >> $ROCKETMQ_HOME/conf/2m-2s-sync/broker-a.properties \
    && echo "listenPort=$LISTEN_PORT" >> $ROCKETMQ_HOME/conf/2m-2s-sync/broker-a.properties \
    && echo "autoCreateTopicEnable=true" >> $ROCKETMQ_HOME/conf/2m-2s-sync/broker-a.properties \
    && echo "autoCreateSubscriptionGroup=true" >> $ROCKETMQ_HOME/conf/2m-2s-sync/broker-a.properties

CMD cd ${ROCKETMQ_HOME}/bin && export JAVA_OPT=" -Duser.home=/opt" && sh mqbroker -c $ROCKETMQ_HOME/conf/2m-2s-sync/broker-a.properties

EXPOSE 10909 10911
VOLUME /opt/logs \
		/opt/store

