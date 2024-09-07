FROM tomcat:8.5.47-jdk8-openjdk
# Take the war and copy to webapps of tomcat
COPY target/myapp-1.0.war /usr/local/tomcat/webapps
