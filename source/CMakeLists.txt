cmake_minimum_required(VERSION 3.20)

cmake_path(GET CMAKE_SOURCE_DIR FILENAME project_name)

project(${project_name} VERSION 1.0.0 LANGUAGES CXX)

message(STATUS "Project Source: ${CMAKE_SOURCE_DIR}")
set(PROJ_SRC_DIR "${CMAKE_SOURCE_DIR}")
set(PROJ_SRC_INC_DIR "${PROJ_SRC_DIR}/include")
set(PROJ_SRC_LIB_DIR "${PROJ_SRC_DIR}/lib")

if(IS_DIRECTORY ${PROJ_SRC_INC_DIR})
    message(STATUS "Project Include: ${PROJ_SRC_INC_DIR}")
endif()
if(IS_DIRECTORY "${CMAKE_BINARY_DIR}")
    message(STATUS "Project Build: ${CMAKE_BINARY_DIR}")
endif()