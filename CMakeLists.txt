cmake_minimum_required(VERSION 3.5)
project(CPGA
        VERSION 1.0
        DESCRIPTION "Cryptographic Procedure-Generative Algorithm. Made for personnel training"
        LANGUAGES C)

set(SOURCES
    src/hashmap.c
    src/main.c
)

add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(CPGA
    PRIVATE
        ${PROJECT_SOURCE_DIR}/include
)
