# Start from a base image.
FROM apache/incubator-rocketmq-base:4.0.0-incubating

# Rocketmq version
ENV ROCKETMQ_VERSION 4.0.0-incubating

# Rocketmq home
ENV ROCKETMQ_HOME  /opt/rocketmq-${ROCKETMQ_VERSION}

WORKDIR  ${ROCKETMQ_HOME}

RUN mkdir -p \
		/opt/logs \
	    /opt/store


RUN chmod +x bin/mqbroker

ARG BROKER_IP1=192.168.220.141
ARG LISTEN_PORT=10911

RUN echo "brokerIP1=$BROKER_IP1" >> $ROCKETMQ_HOME/conf/2m-2s-sync/broker-a.properties \
    && echo "listenPort=$LISTEN_PORT" >> $ROCKETMQ_HOME/conf/2m-2s-sync/broker-a.properties \
    && echo "autoCreateTopicEnable=true" >> $ROCKETMQ_HOME/conf/2m-2s-sync/broker-a.properties \
    && echo "autoCreateSubscriptionGroup=true" >> $ROCKETMQ_HOME/conf/2m-2s-sync/broker-a.properties

CMD cd ${ROCKETMQ_HOME}/bin && export JAVA_OPT=" -Duser.home=/opt" && nohup sh mqbroker -c $ROCKETMQ_HOME/conf/2m-2s-sync/broker-a.properties 2>&1 &

VOLUME /opt/logs \
		/opt/store

