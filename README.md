WHATAP APM Preinstalled Dockerfile

Based on dordoka/tomcat

Ubuntu 14.04
Oracle JDK 8
Tomcat 8

## TO RUN ON BACKGROUND
docker run -d -e "license={Your_WhaTap_License_Here}" -e "server={Your_WhaTap_Server_Here}" immigration9/whatap-preinstalled:{VERSION}

License Key and Server Information can be acquired from https://apm.whatap.io
