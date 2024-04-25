cmake_minimum_required(VERSION 3.0)
project(CPGA)

set(SOURCES
    src/hashmap.c
    src/main.c
)

add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(CPGA
    PRIVATE
        ${PROJECT_SOURCE_DIR}/include
)
