FROM openjdk:11-jre-slim
VOLUME /tmp
COPY target/*.war /ATA-0.0.1-SNAPSHOT.war
CMD ["java", "-jar", "/ATA-0.0.1-SNAPSHOT.war"]
EXPOSE 8080