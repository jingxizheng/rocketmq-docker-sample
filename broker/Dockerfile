ARG BASE_IMAGE=rocketmq-base-image:4.0.0-incubating

# Start from a base image.
FROM $BASE_IMAGE

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
ARG PROPERTIES_FILE="2m-2s-sync/broker-a.properties"

RUN echo "brokerIP1=$BROKER_IP1" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE \
    && echo "listenPort=$LISTEN_PORT" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE \
    && echo "autoCreateTopicEnable=true" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE \
    && echo "autoCreateSubscriptionGroup=true" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE

CMD cd ${ROCKETMQ_HOME}/bin && export JAVA_OPT=" -Duser.home=/opt" && sh mqbroker -c $ROCKETMQ_HOME/conf/$PROPERTIES_FILE 2>&1

VOLUME /opt/logs \
		/opt/store

