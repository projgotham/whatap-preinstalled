#!/bin/sh
echo "license=$license" >> whatap/whatap.conf
echo "whatap.server.host=$server" >> whatap/whatap.conf
sh /opt/tomcat/bin/catalina.sh run
