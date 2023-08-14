# Minimum required version of CMake
cmake_minimum_required(VERSION 3.10)

# Project name
project(CPPClient)

# Find the required packages
find_package(cpr REQUIRED)
find_package(nlohmann_json 3.2.0 REQUIRED)

# Add the executable
add_executable(cpp_client pistache_test.cpp) # Change the filename if needed

# Link the executable with the necessary libraries
target_link_libraries(cpp_client cpr::cpr nlohmann_json::nlohmann_json)

# Set the C++ standard to use
set_property(TARGET cpp_client PROPERTY CXX_STANDARD 20)
