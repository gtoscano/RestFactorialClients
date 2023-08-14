cmake_minimum_required(VERSION 3.0)
project(MainJavaProject NONE)

# Path to the JSON JAR file
set(JSON_JAR "json-20210307.jar")

# Source files
set(SOURCE_FILES Main.java)

# Custom command to compile Java code using javac
add_custom_target(
    CompileJava ALL
    COMMAND javac -cp ${CMAKE_CURRENT_SOURCE_DIR}/"json-20210307.jar" -d ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/Main.java
    DEPENDS ${SOURCE_FILES}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Compiling Java code with javac"
)
configure_file(json-20210307.jar ${CMAKE_CURRENT_BINARY_DIR}/json-20210307.jar COPYONLY)

