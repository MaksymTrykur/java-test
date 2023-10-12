FROM maven:3.6.1-jdk-8-alpine
WORKDIR /app
COPY . /app
RUN mvn clean install -DskipTests
ENTRYPOINT ["java","-jar","/app/target/sample-0.0.1-SNAPSHOT.jar"]