# Use a minimal base image
FROM ubuntu:22.04




# Download and extract Tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz -P /tmp
    tar -xvzf /tmp/apache-tomcat-9.0.93.tar.gz -C /opt 
    rm /tmp/apache-tomcat-9.0.93.tar.gz
    mv /opt/ apache-tomcat-9.0.93 /opt/tomcat

# Set environment variables
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Expose Tomcat port
EXPOSE 8081

# Start Tomcat
CMD ["catalina.sh", "run"]


