FROM maven:3.6-jdk-8 as builder
WORKDIR /app
COPY . .
RUN mvn clean install

FROM openjdk:8-jre-slim
WORKDIR /app
COPY --from=builder /app/target/sample-0.0.1-SNAPSHOT.jar /app/sample.jar
EXPOSE 8080
CMD ["java", "-jar", "/app/sample.jar"]