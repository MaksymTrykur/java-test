FROM maven:3.6.3-openjdk-8
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN mvn package -DskipTests
CMD ["java", "-jar", "target/sample-0.0.1-SNAPSHOT.jar"]