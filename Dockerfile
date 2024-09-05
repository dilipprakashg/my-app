FROM tomcat:9
# Take the war and copy to webapps of tomcat
COPY target/myapp-1.0.war /usr/local/tomcat/webapps/
 
