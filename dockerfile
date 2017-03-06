FROM dordoka/tomcat

MAINTAINER MinGu Lee <mglee@whatap.io>

# Edit Catalina file to Attach WhaTap APM Agent
ADD attach_script.sh /
RUN cat /attach_script.sh >> /opt/tomcat/bin/catalina_new.sh
RUN cat /opt/tomcat/bin/catalina.sh >> /opt/tomcat/bin/catalina_new.sh
RUN rm /opt/tomcat/bin/catalina.sh
RUN mv /opt/tomcat/bin/catalina_new.sh /opt/tomcat/bin/catalina.sh
RUN chmod +x /opt/tomcat/bin/catalina.sh

# Download WhaTap APM Agent through wget
RUN wget https://apm.whatap.io/agent/whatap.agent.java.tar.gz -P /
RUN tar -zxvf whatap.agent.java.tar.gz

# Change license key for personal usage
# Must be added to the directory which dockerfile is located in
ADD whatap.conf /
RUN chmod +x whatap/whatap.conf
RUN mv /whatap.conf whatap/whatap.conf

# <DEPRECATED> Used for Self Testing
## RUN rm whatap/whatap.conf
## RUN touch whatap/whatap.conf
## RUN echo license=x42gn23udh0h3-x3mls0icg8isdq-z5e74l902uiuv8 >> whatap/whatap.conf
## RUN echo whatap.server.host=52.78.209.94/52.78.224.235 >> whatap/whatap.conf

# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
