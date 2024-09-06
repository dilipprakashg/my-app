FROM ubuntu:22.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-17-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz -P /tmp
RUN cd /tmp && tar xvfz apache-tomcat-9.0.93.tar.gz

EXPOSE 8081

CMD /usr/local/tomcat/bin/catalina.sh run
