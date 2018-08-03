#!/bin/bash

WMSAPP_HOME=/usr/local/WowzaStreamingEngine-4.7.5_01
WMSCONFIG_HOME=/usr/local/WowzaStreamingEngine-4.7.5_01
WMSCONFIG_URL=

if [ -d //usr/local/WowzaStreamingEngine-4.7.5_01/java ]; then
    WMSJAVA_HOME=$WMSAPP_HOME/java
    _EXECJAVA=$WMSJAVA_HOME/bin/java
else
    _EXECJAVA=java
fi 

export WMSAPP_HOME WMSCONFIG_HOME JAVA_OPTS _EXECJAVA WMSJAVA_HOME
