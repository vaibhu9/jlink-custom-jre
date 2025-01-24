# Base image with minimal Java dependencies
FROM debian:bullseye-slim

# Set the working directory
WORKDIR /app

# Copy the custom JRE
COPY jlink-custom-jre/custom-runtime /opt/custom-runtime

# Add your application JAR file
COPY jlink-custom-jre/build/libs/jlink-custom-jre-0.0.1-SNAPSHOT.jar /app/jlink-custom-jre-0.0.1-SNAPSHOT.jar

# Set the environment variable for the custom JRE
ENV JAVA_HOME=/opt/custom-runtime
ENV PATH="$JAVA_HOME/bin:$PATH"

# Expose the application port (adjust based on your app's configuration)
EXPOSE 8080

# Define the entry point
ENTRYPOINT ["java", "-jar", "/app/jlink-custom-jre-0.0.1-SNAPSHOT.jar"]
