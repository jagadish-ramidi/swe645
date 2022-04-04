FROM tomcat:9.0.31-jdk8-adoptopenjdk-openj9
MAINTAINER jagadish
ADD Hw1.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]