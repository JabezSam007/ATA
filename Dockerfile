FROM openjdk:11-jre-slim

# Copy the WAR file into the container
COPY target/your-app.war /app.war

# Set the start command
CMD ["java", "-jar", "/app.war"]
