FROM tomcat:8.0
# RUN se ejecuta en construccion, CMD es el comando con el que se ejecutara el container
# tomcat:8.0 ya tiene un CMD que arranca catalina.sh run, lo que haremos es machacar ese CMD para que use el nuestro

ADD logging.properties /usr/local/tomcat/conf/logging.properties 

ADD server.xml /usr/local/tomcat/conf/server.xml 

CMD /usr/local/tomcat/bin/startup.sh && touch /usr/local/tomcat/logs/localhost_access_log.txt && tail -f /usr/local/tomcat/logs/localhost_access_log.txt
