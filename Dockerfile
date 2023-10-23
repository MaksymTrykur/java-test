FROM maven:3.6.3-jdk-8
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN mvn clean package

FROM openjdk:8-jdk-alpine
COPY --from=0 /usr/src/app/target/sample-0.0.1-SNAPSHOT.jar /usr/app/sample.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/app/sample.jar"]