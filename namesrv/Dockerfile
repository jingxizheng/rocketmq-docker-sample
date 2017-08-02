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

RUN chmod +x bin/mqnamesrv

VOLUME /opt/logs \
		/opt/store

RUN cd ${ROCKETMQ_HOME}/bin && export JAVA_OPT=" -Duser.home=/opt" && nohup sh mqnamesrv 2>&1 &

CMD tail -f ../../logs/rocketmqlogs/namesrv.log


