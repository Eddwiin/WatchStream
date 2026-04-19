FROM maven:3.9-eclipse-temurin-24 AS builder

WORKDIR /app

# Copy only poms first to leverage Docker cache for dependencies
COPY pom.xml .
COPY common/pom.xml common/pom.xml
COPY common/common-application/pom.xml common/common-application/pom.xml
COPY movie-service/pom.xml movie-service/pom.xml
COPY movie-service/movie-application/pom.xml movie-service/movie-application/pom.xml
COPY movie-service/movie-container/pom.xml movie-service/movie-container/pom.xml

# Download dependencies
RUN mvn dependency:go-offline -B

# Copy the rest of the source code
COPY . .

# Build argument to specify which module to build
ARG JAR_FILE_PATH

# Build the project
RUN mvn clean package -DskipTests

FROM eclipse-temurin:24-jre-alpine AS runtime

WORKDIR /app

# Argument to specify the final jar location
ARG JAR_FILE_PATH
RUN if [ -z "$JAR_FILE_PATH" ]; then echo "JAR_FILE_PATH argument is required" && exit 1; fi
COPY --from=builder /app/${JAR_FILE_PATH} app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
