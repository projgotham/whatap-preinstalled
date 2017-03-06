#!/bin/sh
WHATAP_HOME=/opt/tomcat/whatap
WHATAP_JAR=`ls ${WHATAP_HOME}/whatap.agent.tracer-*.jar | sort | tail -1`
JAVA_OPTS=" -javaagent:${WHATAP_JAR} "
