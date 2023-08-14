cmake_minimum_required(VERSION 3.10)
project(PistacheTest)

# Path to Rust source file (adjust if needed)
set(RUST_SOURCE_FILE "src/main.rs")

# Output path for compiled binary
set(OUTPUT_BINARY "${CMAKE_BINARY_DIR}/pistache_test")

# Custom target to build Rust code using Cargo
add_custom_target(
    BuildRust ALL
    COMMAND cargo build --release
    DEPENDS ${RUST_SOURCE_FILE}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Building Rust code with Cargo"
)

# Custom command to copy the compiled binary to the output directory
add_custom_command(
    TARGET BuildRust
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_SOURCE_DIR}/target/release/pistache_test" ${OUTPUT_BINARY}
    COMMENT "Copying compiled binary to output directory"
)
