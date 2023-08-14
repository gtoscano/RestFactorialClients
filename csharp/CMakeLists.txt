cmake_minimum_required(VERSION 3.0)
project(CSClient NONE)

# Define the source files
set(SOURCE_FILES Program.cs)


set(OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR}/CSClient.exe)
# Custom command to compile C# code using mcs
add_custom_target(
    CompileCSharp ALL
    COMMAND mcs -r:System.Web.Extensions.dll -out:${OUTPUT_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/Program.cs  
    DEPENDS ${SOURCE_FILES}
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "Compiling C# code with mcs"
)

