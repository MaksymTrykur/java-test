# Start with a base image containing Java runtime and Maven
FROM maven:3.6.3-openjdk-8

# Add Maintainer Info
LABEL maintainer='example@domain.com'

# Create Directory for storing the application
RUN mkdir -p /usr/src/app

# Change to the app directory
WORKDIR /usr/src/app

# Copy application's build file to the container
COPY . /usr/src/app

# Package the application
RUN mvn package

# Execute the application
ENTRYPOINT ["java","-jar","target/sample-0.0.1-SNAPSHOT.jar"]
