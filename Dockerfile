# Use Tomcat 10.1 with a modern JDK 21 (fully compatible with cgroup v2)
# This base image is well-maintained and includes a newer JDK.
FROM tomcat:10.1-jdk21-temurin-jammy

# Remove default Tomcat apps to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR built by Maven from the workspace
COPY target/LoginWebApp.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat in the foreground
CMD ["catalina.sh", "run"]
