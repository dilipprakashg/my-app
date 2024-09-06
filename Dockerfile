FROM ubuntu:22.04
RUN apt update
RUN apt install fontconfig openjdk-17-jre
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz -P /tmp
RUN cd tmp && tar -xvzf apache-tomcat-9.0.93.tar.gz -C /opt
RUN ln -s /opt/apache-tomcat-9.0.93 /opt/tomcat
CMD ["/opt/tomcat/bin/Catalina.sh" ,"run"]

