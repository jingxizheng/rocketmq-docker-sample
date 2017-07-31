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

RUN chmod +x bin/mqnamesrv

CMD cd ${ROCKETMQ_HOME}/bin && export JAVA_OPT=" -Duser.home=/opt" && sh mqnamesrv

EXPOSE 9876
VOLUME /opt/logs \
		/opt/store

