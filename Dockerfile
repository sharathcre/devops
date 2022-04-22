FROM tomcat:7.0
ADD /var/lib/jenkins/workspace/Project4/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
