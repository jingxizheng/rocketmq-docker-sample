#!/bin/bash

sudo docker stop rmqnamesrv && docker stop rmqbroker && docker rm rmqnamesrv && docker rm rmqbroker

sudo docker build -t rocketmq-base-image:4.0.0-incubating ./base

sudo docker build -t rocketmq-namesrv-image:4.0.0-incubating ./namesrv

sudo docker build -t rocketmq-broker-a-m-image:4.0.0-incubating ./broker

sudo docker run -d -p 9876:9876 --name rmqnamesrv rocketmq-namesrv-image:4.0.0-incubating

sudo docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker --link rmqnamesrv:rmqnamesrv -e "NAMESRV_ADDR=rmqnamesrv:9876" rocketmq-broker-a-m-image:4.0.0-incubating
