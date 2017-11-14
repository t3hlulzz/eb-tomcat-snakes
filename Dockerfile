FROM tomcat:8.5.23-jre8-alpine
RUN ["rm", "-rf", "/usr/local/tomcat/webapps/ROOT"]
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war
