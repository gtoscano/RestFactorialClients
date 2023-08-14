cmake_minimum_required(VERSION 3.10)
project(PythonPistache)
configure_file(pistache_test.jl  ${CMAKE_CURRENT_BINARY_DIR}/pistache_test.jl COPYONLY)
configure_file(install_dependencies.jl  ${CMAKE_CURRENT_BINARY_DIR}/install_dependencies.jl COPYONLY)


