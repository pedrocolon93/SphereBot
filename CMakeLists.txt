cmake_minimum_required(VERSION 3.6)
project(SphereBot)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES atttinysoftware/multiplexer/multiplexer.44.c)
add_executable(SphereBot ${SOURCE_FILES})