cmake_minimum_required(VERSION 3.10)
project(MultiLanguageBindings)

# List of subdirectories
set(SUBDIRS cpp csharp java rust)

# Add subdirectories for each language, setting specific output directories
foreach(SUBDIR ${SUBDIRS})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${SUBDIR})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${SUBDIR})
  add_subdirectory(${SUBDIR})
endforeach()

configure_file(python/pistache_test.py ${CMAKE_CURRENT_BINARY_DIR}/pistache_test.py COPYONLY)
configure_file(julia/pistache_test.jl ${CMAKE_CURRENT_BINARY_DIR}/pistache_test.jl COPYONLY)
configure_file(octave/pistache_test.m ${CMAKE_CURRENT_BINARY_DIR}/pistache_test.m COPYONLY)
configure_file(R/pistache_test.R ${CMAKE_CURRENT_BINARY_DIR}/pistache_test.R COPYONLY)
configure_file(golang/pistache.go ${CMAKE_CURRENT_BINARY_DIR}/pistache.go COPYONLY)

