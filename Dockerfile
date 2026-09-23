# Use Tomcat 9 with JDK 17 (matches your pom.xml target)
FROM tomcat:9.0-jdk17-openjdk-slim

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file built by Maven into Tomcat's webapps folder
COPY target/LoginWebApp.war /usr/local/tomcat/webapps/ROOT.war

# Expose the Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
