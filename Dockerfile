FROM maven:3.9.9-amazoncorretto-17-al2023 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests



FROM openjdk:21-slim-bullseye
WORKDIR /app
COPY --from=build /app/target/beststore-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
