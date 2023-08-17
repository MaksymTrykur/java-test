FROM maven:3.6.3-openjdk-8 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package
FROM openjdk:8-jdk-alpine
COPY --from=build /usr/src/app/target/sample-0.0.1-SNAPSHOT.jar /usr/app/sample.jar
WORKDIR /usr/app
ENTRYPOINT ["java","-jar","sample.jar"]