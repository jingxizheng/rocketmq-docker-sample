ARG BASE_IMAGE
#=rocketmq-base-image:4.0.0-incubating

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

ARG BROKER_IP1
#=192.168.220.141
ARG LISTEN_PORT
#=10911
ARG PROPERTIES_FILE
#="2m-2s-async/broker-a.properties"

ENV PROPERTIES_FILE $PROPERTIES_FILE

RUN echo "brokerIP1=$BROKER_IP1" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE \
    && echo "listenPort=$LISTEN_PORT" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE \
    && echo "autoCreateTopicEnable=true" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE \
    && echo "autoCreateSubscriptionGroup=true" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE

VOLUME /opt/logs \
		/opt/store

ENV JAVA_OPT=" -Duser.home=/opt"

WORKDIR ${ROCKETMQ_HOME}/bin

CMD sh mqbroker -c $ROCKETMQ_HOME/conf/$PROPERTIES_FILE
