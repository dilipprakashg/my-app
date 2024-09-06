FROM tomcat:9.0.93
# Take the war and copy to webapps of tomcat
COPY target/myapp-1.0.war /opt/tomcat/webapps
