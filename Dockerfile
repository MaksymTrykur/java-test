FROM maven:3.6.0-jdk-8-alpine
WORKDIR /app
COPY . /app
RUN mvn clean install
CMD ["java","-jar","target/sample-0.0.1-SNAPSHOT.jar"]