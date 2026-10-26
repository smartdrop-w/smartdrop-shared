# =============================================================================
# SMARTDROP PLATFORM - SHARED LIBRARY DOCKERFILE BUILD (JAVA 21)
# =============================================================================
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app

COPY .mvn/ .mvn/
COPY mvnw pom.xml ./
RUN chmod +x ./mvnw && ./mvnw dependency:go-offline -B || true

COPY src ./src
RUN ./mvnw clean install -DskipTests

# Stage verificador de empaquetado de librería
FROM alpine:latest AS verify
WORKDIR /app
COPY --from=build /app/target/*.jar ./smartdrop-shared.jar
CMD ["echo", "SmartDrop Shared Library built successfully."]
