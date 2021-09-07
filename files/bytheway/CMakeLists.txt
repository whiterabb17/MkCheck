cmake_minimum_required(VERSION 3.2)

set(PROJECT_NAME btw)
project(${PROJECT_NAME})

set(CMAKE_CXX_FLAGS "-g -std=c++17 -Wall -Wextra -Weffc++ -Wshadow -Wcast-align -Wcast-qual -Woverloaded-virtual -Wstrict-null-sentinel -Wswitch-default -Winit-self -Wlogical-op -Wno-deprecated-declarations")

find_package(Boost 1.66 COMPONENTS program_options system regex REQUIRED)

include_directories(SYSTEM ${Boost_INCLUDE_DIR})
include_directories(src/common/)

# compilation units
add_executable(${PROJECT_NAME}
                src/main.cpp
                src/common/md5.cpp
                src/common/session.cpp
                src/common/winbox_session.cpp
                src/common/winbox_message.cpp)

# linking comp / libs
target_link_libraries(${PROJECT_NAME} ${Boost_LIBRARIES} -lpthread)
