FROM tomcat:8.0

ADD logging.properties /usr/local/tomcat/conf/logging.properties 

ADD server.xml /usr/local/tomcat/conf/server.xml 

CMD /usr/local/tomcat/bin/startup.sh && touch /usr/local/tomcat/logs/localhost_access_log.txt && tail -f /usr/local/tomcat/logs/localhost_access_log.txt
