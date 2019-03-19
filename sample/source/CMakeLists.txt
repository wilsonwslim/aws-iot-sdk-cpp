# Copyright (C) 2019 Moxa Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

######################################
# Section : Disable in-source builds #
######################################
if (${PROJECT_SOURCE_DIR} STREQUAL ${PROJECT_BINARY_DIR})
    message(FATAL_ERROR "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there. You may need to remove CMakeCache.txt and CMakeFiles folder.")
endif ()

####################################
# Section : Common Build setttings #
####################################
# Set required compiler standard to standard c++11. Disable extensions.
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
unset(CMAKE_RUNTIME_OUTPUT_DIRECTORY) 

##########################################
# Target : Build moxa_sample_mqtt sample #
##########################################
set(MOXA_SAMPLE_TARGET_NAME moxa_sample_mqtt)
# Add Target
add_executable(
    ${MOXA_SAMPLE_TARGET_NAME}
    "moxa_sample_mqtt.cpp;${PROJECT_SOURCE_DIR}/common/ConfigCommon.cpp"
)

# Add Target specific includes
target_include_directories(${MOXA_SAMPLE_TARGET_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/common)
target_include_directories(${MOXA_SAMPLE_TARGET_NAME} PUBLIC .)

# Configure Threading library
find_package(Threads REQUIRED)

# Add SDK includes
set(
    CMAKE_EXE_LINKER_FLAGS
    "${CMAKE_EXE_LINKER_FLAGS} -Wl,-rpath,/usr/lib/iothinx"
)

find_library(
    IOTHINXIO_LIB
    NAMES iothinxio
    HINTS ${IOTHINXIO_LIB_DIR}
)

target_include_directories(${MOXA_SAMPLE_TARGET_NAME} PUBLIC ${CMAKE_BINARY_DIR}/${DEPENDENCY_DIR}/rapidjson/src/include)
target_include_directories(${MOXA_SAMPLE_TARGET_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/include)
target_include_directories(${MOXA_SAMPLE_TARGET_NAME} PUBLIC ${IOTHINXIO_INC_DIR})

target_link_libraries(${MOXA_SAMPLE_TARGET_NAME} PUBLIC "Threads::Threads")
target_link_libraries(${MOXA_SAMPLE_TARGET_NAME} PUBLIC ${SDK_TARGET_NAME})
target_link_libraries(${MOXA_SAMPLE_TARGET_NAME} PUBLIC ${IOTHINXIO_LIB})

# Copy Json config file
add_custom_command(TARGET ${MOXA_SAMPLE_TARGET_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E
        copy ${PROJECT_SOURCE_DIR}/common/SampleConfig.json $<TARGET_FILE_DIR:${MOXA_SAMPLE_TARGET_NAME}>/config/SampleConfig.json)
set_property(TARGET ${MOXA_SAMPLE_TARGET_NAME} APPEND_STRING PROPERTY COMPILE_FLAGS ${CUSTOM_COMPILER_FLAGS})

# Gather list of all .cert files in "/cert"
add_custom_command(TARGET ${MOXA_SAMPLE_TARGET_NAME} PRE_BUILD
        COMMAND ${CMAKE_COMMAND} -E
        copy_directory ${PROJECT_SOURCE_DIR}/certs $<TARGET_FILE_DIR:${MOXA_SAMPLE_TARGET_NAME}>/certs)

#########################
# Add Network libraries #
#########################
set(NETWORK_WRAPPER_DEST_TARGET ${MOXA_SAMPLE_TARGET_NAME})
include(${PROJECT_SOURCE_DIR}/network/CMakeLists.txt.in)
