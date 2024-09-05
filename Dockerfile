# Use a minimal base image
FROM ubuntu:22.04

# Set the Tomcat version
ENV TOMCAT_VERSION 10.1.19

# Install dependencies
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract Tomcat
RUN wget -O /tmp/tomcat.tar.gz https://dlcdn.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar xf /tmp/tomcat.tar.gz -C /opt && \
    rm /tmp/tomcat.tar.gz && \
    mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat

# Set environment variables
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH# Take the war and copy to webapps of tomcat
COPY target/newapp.war /usr/local/tomcat/webapps/

# Expose Tomcat port
EXPOSE 8080

# Clean up unnecessary files
RUN apt-get purge -y openjdk-11-jdk wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /opt/tomcat/webapps/*



# Take the war and copy to webapps of tomcat
COPY target/ myapp-1.0.war /usr/local/tomcat/webapps/


# Start Tomcat
CMD ["catalina.sh", "run"]
