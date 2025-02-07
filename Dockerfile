FROM eclipse-temurin:17-jre-alpine

WORKDIR /app
COPY target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar app.jar

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

ENTRYPOINT ["java", "-jar", "-XX:+UseContainerSupport", "-XX:MaxRAMPercentage=75.0", "-XX:+UseG1GC", "/app/app.jar"]