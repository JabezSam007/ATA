FROM openjdk:11-jre-slim

# Copy the WAR file into the container
COPY target/*.war /ATA-0.0.1-SNAPSHOT.war

# Set the start command
CMD ["java", "-jar", "/ATA-0.0.1-SNAPSHOT.war"]
