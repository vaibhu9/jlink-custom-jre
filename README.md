# jlink-custom-jre

## Custom Java Runtime Image with jlink

This project demonstrates how to create a custom Java runtime image using the `jlink` tool. By including only the necessary modules, we can optimize performance and reduce memory usage for our application.

## Overview

The example program logs a simple "Hello World!" message using the `java.util.logging` package. The application uses the following classes:
- `HelloWorld`
- `String`
- `Logger`
- `Object`

## Prerequisites

- Java Development Kit (JDK) 11 or higher
- Basic understanding of Java modules and runtime images

## Example Application

The application code is structured as follows:

### `HelloWorld.java`
```java
import java.util.logging.Logger;

public class HelloWorld {
    private static final Logger LOG = Logger.getLogger(HelloWorld.class.getName());
    public static void main(String[] args) {
        LOG.info("Hello World!");
    }
}

module-info.java

module jlinkModule {
    requires java.logging;
}
```
## Impact of Custom Runtime Images
- Improved Performance: Reduces the size of the runtime by including only necessary modules.
- Lower Memory Usage: Optimizes resource utilization.

# Steps to Create a Custom Java Runtime Image

## 1. List Modules Required by the Application
Run the following command to identify the modules used in your application:

```bash
jdeps --print-module-deps build/libs/application-0.0.1-SNAPSHOT.jar
```
This will output the list of required modules (e.g., java.base,java.logging).

## 2. Create the Custom Java Runtime Image
Use jlink to create a custom runtime image that includes only the required modules:

```bash
jlink --module-path $JAVA_HOME/jmods:lib --add-modules java.base,java.logging --output custom-jre
```
## 3. Run the Application
Run the application using the custom runtime image:

```bash
custom-jre/bin/java -jar application-0.0.1-SNAPSHOT.jar
```
#### Notes
- Replace application-0.0.1-SNAPSHOT.jar with the actual path to your JAR file.
- The module path ($JAVA_HOME/jmods) is specific to your JDK installation.