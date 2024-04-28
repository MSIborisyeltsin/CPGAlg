cmake_minimum_required(VERSION 3.5)
project(CPGA
        VERSION 1.0
        DESCRIPTION "Cryptographic Procedure-Generative Algorithm. Made for personnel training"
        )

set(SOURCES
    src/hashmap.c
    src/main.c
    src/KGB/KGB-dec.c
    src/KGB/KGB-enc.c
)

set(HEADERS
    include/KGB/KeySplit.h
    include/KGB/KGB-dec.h
    include/KGB/KGB-enc.h
    include/blockmethod.hpp
    include/hashmap.h
    include/key.h
    include/puts.h
)

add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS})

target_include_directories(CPGA
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)
