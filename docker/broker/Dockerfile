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

CMD echo "brokerIP1=192.168.220.141" >> $ROCKETMQ_HOME/conf/2m-noslave/broker-a.properties
CMD echo "listenPort=10911" >> $ROCKETMQ_HOME/conf/2m-noslave/broker-a.properties
CMD echo "autoCreateTopicEnable=true" >> $ROCKETMQ_HOME/conf/2m-noslave/broker-a.properties
CMD echo "autoCreateSubscriptionGroup=true" >> $ROCKETMQ_HOME/conf/2m-noslave/broker-a.properties

CMD cd ${ROCKETMQ_HOME}/bin && export JAVA_OPT=" -Duser.home=/opt" && sh mqbroker -c $ROCKETMQ_HOME/conf/2m-noslave/broker-a.properties

EXPOSE 10909 10911
VOLUME /opt/logs \
		/opt/store

