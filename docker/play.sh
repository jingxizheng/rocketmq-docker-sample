#!/bin/bash
sudo docker build -t apache/incubator-rocketmq-base:4.0.0-incubating ./base

sudo docker run -d -p 9876:9876 --name rmqnamesrv  apache/incubator-rocketmq-base:4.0.0-incubating

sudo docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker --link rmqnamesrv:rmqnamesrv -e "NAMESRV_ADDR=rmqnamesrv:9876" apache/incubator-rocketmq-base:4.0.0-incubating
