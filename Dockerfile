# Single stage: just run the pre-built JAR
FROM eclipse-temurin:8-jre-alpine

WORKDIR /app

# Copy the pre-built JAR from local build folder
COPY build/libs/spring-boot-thymeleaf-example-1.0-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]